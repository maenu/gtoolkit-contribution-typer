Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typIsReturnSelf [
	^ ((self allChildren select: #isReturn) reject: [ :e | e value isSelf ]) isEmpty
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
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aSymbol ].
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
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArguments [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ self arguments collect: #typType
]
