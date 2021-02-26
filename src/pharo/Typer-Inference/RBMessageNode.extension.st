Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typArgumentTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| key |
	key := #typTypeForArgument , anInteger asString.
	^ self
		propertyAt: key
		ifAbsentPut: [ "typCastAs TypType"
			| receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typReceiverType.
			argumentTypes := self typArgumentTypes.
			TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup
						receiver: receiverType
						selector: self selector asSymbol
						arguments: argumentTypes)
				at: anInteger ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typReceiverType [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typResultType [
	| key |
	key := #typResultType.
	^ self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			"typCastAs TypType"
			| receiverType argumentTypes |
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typReceiverType.
			argumentTypes := self typArgumentTypes.
			((receiverType canUnderstand: self selector asSymbol) not
				and: [ receiverType asNonNullable canUnderstand: self selector asSymbol ])
				ifTrue: [ receiverType := receiverType asNonNullable ].
			TypMethodLookupIndex instance
				resultTypeFor:
					(TypMethodLookup
						receiver: receiverType
						selector: self selector asSymbol
						arguments: argumentTypes) ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typSignalsAlways [
	| key |
	key := #typSignalsAlways.
	^ self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			"typCastAs {!,Boolean}"
			| receiverType argumentTypes |
			self propertyAt: key put: nil.
			receiverType := self typReceiverType.
			argumentTypes := self typArgumentTypes.
			receiverType isUnion
				ifTrue: [ | signalsAlways |
					signalsAlways := receiverType types
						collect: [ :e | 
							TypMethodLookupIndex instance
								signalsAlwaysFor:
									(TypMethodLookup
										receiver: e
										selector: self selector asSymbol
										arguments: argumentTypes) ].	"typCastAs TypUnionType"
					(signalsAlways anySatisfy: #isNil)
						ifTrue: [ nil ]
						ifFalse: [ signalsAlways inject: true into: [ :a :b | a and: b ] ] ]
				ifFalse: [ TypMethodLookupIndex instance
						signalsAlwaysFor:
							(TypMethodLookup
								receiver: receiverType
								selector: self selector asSymbol
								arguments: argumentTypes) ] ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typTypeRecursive [
	^ self typResultType
]
