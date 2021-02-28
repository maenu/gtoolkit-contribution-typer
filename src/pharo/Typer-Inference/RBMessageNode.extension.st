Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typInfType
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typInfType
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfResult [
	| key |
	key := #typInfResult.
	^ self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			"typCastAs TypType"
			| receiverType argumentTypes |
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typInfReceiver.
			argumentTypes := self typInfArguments.
			((receiverType canUnderstand: self selector asSymbol) not
				and: [ receiverType asNonNullable canUnderstand: self selector asSymbol ])
				ifTrue: [ receiverType := receiverType asNonNullable ].
			(receiverType
				lookupMethod: self selector asSymbol
				arguments: argumentTypes) result ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfSignalsAlways [
	| key |
	key := #typInfSignalsAlways.
	^ self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			"typCastAs {!,Boolean}"
			| receiverType argumentTypes |
			self propertyAt: key put: nil.
			receiverType := self typInfReceiver.
			argumentTypes := self typInfArguments.
			receiverType isUnion
				ifTrue: [ | signalsAlways |
					signalsAlways := receiverType types
						collect: [ :e | 
							(e lookupMethod: self selector asSymbol arguments: argumentTypes)
								signalsAlways ].	"typCastAs TypUnionType"
					(signalsAlways anySatisfy: #isNil)
						ifTrue: [ nil ]
						ifFalse: [ signalsAlways inject: true into: [ :a :b | a and: b ] ] ]
				ifFalse: [ (receiverType
						lookupMethod: self selector asSymbol
						arguments: argumentTypes) signalsAlways ] ]
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
			receiverType := self typInfReceiver.
			argumentTypes := self typInfArguments.
			(receiverType
				lookupMethod: self selector asSymbol
				arguments: argumentTypes) arguments at: anInteger ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursive [
	^ self typInfResult
]
