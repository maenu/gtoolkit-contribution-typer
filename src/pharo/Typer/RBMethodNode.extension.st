Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ ((self allChildren select: #isReturn)
		reject: [ :e | (e "typCastAs RBReturnNode") value isSelf ]) isEmpty
]

{ #category : #'*Typer' }
RBMethodNode >> typType [
	<typTypeResultAs: 'TypType'>
	| profile |
	self typTypeReset.
	profile := (self allChildren select: [ :e | e isKindOf: RBTemporaryNode ]) "typParameters RBTemporaryNode" collect: [ :e | e -> e typType ].
	self typTypeReset.
	profile do: [ :e | e key propertyAt: #typType put: e value ].
	(self allChildren copyWithoutAll: (profile collect: #key) , {self}) do: #typType.
	^ BlockClosure typAsType asFunctionType: self typTypesForArguments result: self typTypeForResult optionalParameters: false
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	^ TypMethodResolvers global
		typeForArgumentAt: anInteger
		ofMethod:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				argumentNodes: (self arguments);
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ TypMethodResolvers global
		typeForResultOfMethod:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				argumentNodes: (self arguments);
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
