Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Core' }
RBMethodNode >> typIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ self method isAbstract not
		and: [ self isPrimitive not
				and:
					[ (self typReturnNodes reject: [ :e | e value isSelf ]) isEmpty ] ]
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typSignalsAlways [
	^ self body typSignalsAlways
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTemporaryProfile [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: [ :e | e isVariable or: [ e isReturn ] ])
		collect: [ :e | e -> e typType ]
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	^ TypMethodLookupIndex instance
		argumentTypeFor:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				argumentNodes: self arguments;
				yourself)
		at: anInteger
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ TypMethodLookupIndex instance
		resultTypeFor:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				argumentNodes: (self arguments);
				yourself)
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| newTemporaryProfile |
	self
		typTypeReset;
		doSemanticAnalysis.
	newTemporaryProfile := self typTemporaryProfile.
	[ | oldTemporaryProfile   |
	self typTypeReset.
	newTemporaryProfile
		do: [ :e | e key propertyAt: #typType put: e value ].
	(self allChildren
		copyWithoutAll: (newTemporaryProfile collect: #key) , {self})
		do: #typType.
	(newTemporaryProfile collect: #key)
		do: [ :e | 
			e
				typTypeReset;
				typType ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typTemporaryProfile.
	newTemporaryProfile = oldTemporaryProfile ] whileFalse.
	^ CompiledMethod
		typAsFunctionTypeWithArguments: self typTypesForArguments
		result: self typTypeForResult
		argumentsOptional: false
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypesForArguments [
	^ self arguments collect: #typType
]
