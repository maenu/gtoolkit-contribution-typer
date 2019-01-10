Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typSignalsAlways [
	<typTypeResultAs: 'Boolean'>
	^ (self
		propertyAt: #typSignalsAlways
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: #typSignalsAlways put: false.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			receiverType isUnion
				ifTrue: [ (receiverType "typCastAs TypUnionType") types
						inject: true into: [ :b :e | 
							b and: [ TypMethodResolvers global
								signalsAlways:
									(TypMethodLookup new
										receiverType: e;
										selector: self selector asSymbol;
										argumentTypes: argumentTypes;
										argumentNodes: self arguments;
										yourself) ] ] ]
				ifFalse: [ TypMethodResolvers global
						signalsAlways:
							(TypMethodLookup new
								receiverType: receiverType;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ] ])
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	^ (self
		propertyAt: #typTypeForArgument , anInteger asString
		ifAbsentPut: [
			| receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: #typTypeForArgument , anInteger asString put: TypUnknownType instance.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			receiverType isUnion
				ifTrue: [ ((receiverType "typCastAs TypUnionType") types
						collect: [ :e | 
							TypMethodResolvers global
								typeForArgumentAt: anInteger
								ofMethod:
									(TypMethodLookup new
										receiverType: e;
										selector: self selector asSymbol;
										argumentTypes: argumentTypes;
										argumentNodes: self arguments;
										yourself) ]) typAsType ]
				ifFalse: [ TypMethodResolvers global
						typeForArgumentAt: anInteger
						ofMethod:
							(TypMethodLookup new
								receiverType: receiverType;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ] ]) "typCastAs TypType"
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ (self
		propertyAt: #typTypeForResult
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			| receiverType argumentTypes |
			self propertyAt: #typTypeForResult put: TypUnknownType instance.
			receiverType := self typTypeForReceiver.
			argumentTypes := self typTypesForArguments.
			receiverType isUnion
				ifTrue: [ ((receiverType "typCastAs TypUnionType") types
						collect: [ :e | 
							TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: e;
										selector: self selector asSymbol;
										argumentTypes: argumentTypes;
										argumentNodes: self arguments;
										yourself) ]) typAsType ]
				ifFalse: [ TypMethodResolvers global
						typeForResultOfMethod:
							(TypMethodLookup new
								receiverType: receiverType;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ] ])
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeRecursive [
	^ self typTypeForResult
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeReset [
	self removeProperty: #typTypeForResult ifAbsent: [  ].
	self arguments size timesCollect: [ :i | self removeProperty: #typTypeForArgument , i asString ifAbsent: [  ] ].
	super typTypeReset
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
