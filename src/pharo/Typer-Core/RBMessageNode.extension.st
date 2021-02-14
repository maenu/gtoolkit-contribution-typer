Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Core' }
RBMessageNode >> typInvokedMethods [
	^ super typInvokedMethods
		, (self typTypeForReceiver lookupSelector: self selector)
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typSignalsAlways [
	| key |
	key := #typSignalsAlways.
	^ (self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: key put: nil.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			receiverType isUnion
				ifTrue: [ | signalsAlways |
					signalsAlways := (receiverType "typCastAs TypUnionType") types
						collect: [ :e | TypMethodLookupIndex instance
								signalsAlwaysFor:
									(TypMethodLookup new
										receiverType: e;
										selector: self selector asSymbol;
										argumentTypes: argumentTypes;
										argumentNodes: self arguments;
										yourself) ].
					(signalsAlways anySatisfy: #isNil)
						ifTrue: [ nil ]
						ifFalse: [ signalsAlways inject: true into: [ :a :b | a and: b ] ] ]
				ifFalse: [ TypMethodLookupIndex instance
						signalsAlwaysFor:
							(TypMethodLookup new
								receiverType: receiverType;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ] ]) "typCastAs {!,Boolean}"
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| key |
	key := #typTypeForArgument , anInteger asString.
	^ self
		propertyAt: key
		ifAbsentPut: [ "typCastAs TypType"
			| receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself)
				at: anInteger ]
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForResult [
	| key |
	key := #typTypeForResult.
	^ self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			((receiverType canUnderstand: self selector asSymbol) not
				and: [ receiverType asNonNullable canUnderstand: self selector asSymbol ])
				ifTrue: [ receiverType := receiverType asNonNullable ].
			TypMethodLookupIndex instance
				resultTypeFor:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself) ]	"typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeRecursive [
	^ self typTypeForResult
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeReset [
	self removeProperty: #typTypeForResult ifAbsent: [  ].
	self arguments size
		timesCollect:
			[ :i | self removeProperty: #typTypeForArgument , i asString ifAbsent: [  ] ].
	self removeProperty: #typSignalsAlways ifAbsent: [  ].
	super typTypeReset
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
