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
RBMethodNode >> typSignalsAlwaysIn: aContext [
	^ self body typSignalsAlwaysIn: aContext
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTemporaryProfileIn: aContext [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: [ :e | e isVariable or: [ e isReturn ] ])
		collect: [ :e | e -> (e typTypeIn: aContext) ]
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForArgumentAt: anInteger in: aContext [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	self assert: [ compilationContext isNotNil ].
	self flag: 'TODO use context for receiver type'.
	^ TypMethodLookupIndex instance
		argumentTypeFor:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: (self typTypesForArgumentsIn: aContext);
				argumentNodes: self arguments;
				yourself)
		at: anInteger
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForArgumentNamed: aString in: aContext [
	<typTypeArgument: 1 as: 'String'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i in: aContext
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeForResultIn: aContext [
	<typTypeResultAs: 'TypType'>
	self assert: [ compilationContext isNotNil ].
	self flag: 'TODO make use of context for receiver'.
	^ TypMethodLookupIndex instance
		resultTypeFor:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: self selector asSymbol;
				argumentTypes: (self typTypesForArgumentsIn: aContext);
				argumentNodes: self arguments;
				yourself)
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeRecursiveIn: aContext [
	<typTypeResultAs: 'TypType'>
	| oldTemporaryProfiles newTemporaryProfile |
	self
		typTypeReset;
		doSemanticAnalysis;
		propertyAt: #typFixPoint -> aContext put: false.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typTemporaryProfileIn: aContext.
	[ | oldTemporaryProfile |
	oldTemporaryProfiles add: newTemporaryProfile.
	self typTypeResetIn: aContext.
	newTemporaryProfile
		do: [ :e | e key propertyAt: #typType -> aContext put: e value ].
	(self allChildren
		copyWithoutAll: (newTemporaryProfile collect: #key) , {self})
		do: [ :e | e typTypeIn: aContext ].
	(newTemporaryProfile collect: #key)
		do: [ :e | 
			e
				typTypeResetIn: aContext;
				typTypeIn: aContext ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typTemporaryProfileIn: aContext.
	oldTemporaryProfile = newTemporaryProfile
		ifTrue: [ self propertyAt: #typFixPoint -> aContext put: true ].
	oldTemporaryProfiles includes: newTemporaryProfile ] whileFalse.
	^ CompiledMethod
		typAsFunctionTypeWithArguments: (self typTypesForArgumentsIn: aContext)
		result: (self typTypeForResultIn: aContext)
		argumentsOptional: false
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeResetIn: aContext [
	self removeProperty: #typFixPoint -> aContext ifAbsent: [  ].
	super typTypeResetIn: aContext
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypesForArgumentsIn: aContext [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: [ :e | e typTypeIn: aContext ]
]
