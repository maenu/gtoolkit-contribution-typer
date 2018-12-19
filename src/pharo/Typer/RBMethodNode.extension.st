Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typAssignmentProfile [
	<typTypeResultAs: 'Set<Association<RBAssignmentNode,TypType>>'>
	^ self typTemporaryAssignments collect: [ :e | e -> e typType ]
]

{ #category : #'*Typer' }
RBMethodNode >> typIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ ((self allChildren select: #isReturn)
		reject: [ :e | (e "typCastAs RBReturnNode") value isSelf ]) isEmpty
]

{ #category : #'*Typer' }
RBMethodNode >> typTemporaries [
	<typTypeResultAs: 'Collection<RBTemporaryNode>'>
	^ (self allChildren
		select: [ :e | e isTemp and: [ e isArgument not ] ]) "typParameters RBTemporaryNode"
]

{ #category : #'*Typer' }
RBMethodNode >> typTemporaryAssignments [
	<typTypeResultAs: 'Set<RBAssignmentNode>'>
	^ (self typTemporaries flatCollect: #typAssignments) asSet
]

{ #category : #'*Typer' }
RBMethodNode >> typType [
	<typTypeResultAs: 'TypType'>
	| oldProfile newProfile |
	self typTypeReset.
	[ oldProfile := self typAssignmentProfile.
	self typTypeReset.
	oldProfile do: [ :e | e key propertyAt: #typType put: e value ].
	self body typType.
	newProfile := self typAssignmentProfile.
	oldProfile = newProfile ] whileFalse.
	"one last time for good measure"
	self typTypeReset.
	newProfile do: [ :e | e key propertyAt: #typType put: e value ].
	self body typType.
	^ BlockClosure typAsType
		asFunctionType: self typTypesForArguments
		result: self typTypeForResult
		optionalParameters: false
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
