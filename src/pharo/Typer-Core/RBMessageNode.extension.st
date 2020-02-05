Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Core' }
RBMessageNode >> typInvokedMethodsIn: aContext [
	^ (super typInvokedMethodsIn: aContext)
		addAll: ((self typTypeForReceiverIn: aContext) lookupSelector: self selector);
		yourself
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typSignalsAlwaysIn: aContext [
	| key |
	key := #typSignalsAlways -> aContext.
	^ (self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: key put: nil.
			receiverType := self typTypeForReceiverIn: aContext.
			argumentTypes := self typTypesForArgumentsIn: aContext.
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
	^ self typTypeForArgumentAt: anInteger in: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForArgumentAt: anInteger in: aContext [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typTypeForArgument , anInteger asString -> aContext.
	^ self
		propertyAt: key
		ifAbsentPut: [ | receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: key put: TypUnknownType instance.
			receiverType := self typTypeForReceiverIn: aContext.
			argumentTypes := self typTypesForArgumentsIn: aContext.
			TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself)
				at: anInteger ]	"typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForReceiver [
	^ self typTypeForReceiverIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForReceiverIn: aContext [
	<typTypeResultAs: 'TypType'>
	^ self receiver typTypeIn: aContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForResult [
	^ self typTypeForResultIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForResultIn: aContext [
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typTypeForResult -> aContext.
	^ (self
		propertyAt: key
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: key put: TypUnknownType instance.
			receiverType := self typTypeForReceiverIn: aContext.
			argumentTypes := self typTypesForArgumentsIn: aContext.
			((receiverType canUnderstand: self selector asSymbol) not
				and:
					[ receiverType asNonNullableType canUnderstand: self selector asSymbol ])
				ifTrue: [ receiverType := receiverType asNonNullableType ].
			TypMethodLookupIndex instance
				resultTypeFor:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself) ]) "typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeRecursiveIn: aContext [
	^ self typTypeForResultIn: aContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeResetIn: aContext [
	self removeProperty: #typTypeForResult -> aContext ifAbsent: [  ].
	self arguments size timesCollect: [ :i | self removeProperty: #typTypeForArgument , i asString -> aContext ifAbsent: [  ] ].
	self removeProperty: #typSignalsAlways -> aContext ifAbsent: [  ].
	super typTypeResetIn: aContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypesForArguments [
	^ self typTypesForArgumentsIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypesForArgumentsIn: aContext [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: [ :e | e typTypeIn: aContext ]
]
