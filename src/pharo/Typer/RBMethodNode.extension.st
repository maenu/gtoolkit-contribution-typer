Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ self method isAbstract not
		and: [ self isPrimitive not
				and:
					[ (self typReturnNodes reject: [ :e | e value isSelf ]) isEmpty ] ]
]

{ #category : #'*Typer' }
RBMethodNode >> typReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer' }
RBMethodNode >> typSignalsAlways [
	^ self body typSignalsAlways
]

{ #category : #'*Typer' }
RBMethodNode >> typTemporaryProfile [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: [ :e | e isTemp ]) collect: [ :e | e -> e typType ]
]

{ #category : #'*Typer' }
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
	^ TypMethodLookupIndex instance
		resultTypeFor:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				argumentNodes: (self arguments);
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| newTemporaryProfile |
	self
		typTypeReset;
		doSemanticAnalysis.
	newTemporaryProfile := self typTemporaryProfile.
	[ | oldTemporaryProfile oldReturnProfile oldSignalsAlwaysProfile |
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
	^ BlockClosure typAsType
		asFunctionType: self typTypesForArguments
		result: self typTypeForResult
		optionalParameters: false
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
