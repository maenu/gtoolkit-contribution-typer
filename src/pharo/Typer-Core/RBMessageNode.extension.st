Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Core' }
RBMessageNode >> typInvokedMethods [
	^ super typInvokedMethods
		addAll: (self typTypeForReceiver lookupSelector: self selector);
		yourself
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typSignalsAlways [
	^ (self
		propertyAt: #typSignalsAlways
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: #typSignalsAlways put: nil.
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
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: #typTypeForArgument , anInteger asString
		ifAbsentPut: [ | receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self
				propertyAt: #typTypeForArgument , anInteger asString
				put: TypUnknownType instance.
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
				at: anInteger ]	"typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: #typTypeForResult
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: #typTypeForResult put: TypUnknownType instance.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			((receiverType canUnderstand: self selector asSymbol) not
				and:
					[ receiverType asNonNullableType canUnderstand: self selector asSymbol ])
				ifTrue: [ self flag: 'TODO flag as nil error, or let checker deal with it?'.
					receiverType := receiverType asNonNullableType ].
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
	self arguments size timesCollect: [ :i | self removeProperty: #typTypeForArgument , i asString ifAbsent: [  ] ].
	self removeProperty: #typSignalsAlways ifAbsent: [  ].
	super typTypeReset
]

{ #category : #'*Typer-Core' }
RBMessageNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
