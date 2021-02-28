Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typInfType
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ self method isAbstract not
		and: [ self isPrimitive not
				and:
					[ (self typInfReturnNodes reject: [ :e | e value isSelf ]) isEmpty ] ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfReceiver [
	self flag: 'FIXME implement'
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfResult [
	<typTypeResultAs: 'TypType'>
	self flag: 'FIXME how to get hold of self?'.
	self assert: [ compilationContext isNotNil ].
	^ (nil
		lookupMethod: self selector asSymbol
		arguments: self typInfArguments) result
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfSignalsAlways [
	^ self body typInfSignalsAlways
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTemporaryProfile [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: [ :e | e isVariable or: [ e isReturn ] ])
		collect: [ :e | e -> e typInfType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	self flag: 'FIXME how to get hold of self?'.
	^ (nil
		lookupMethod: self selector asSymbol
		arguments: self typInfArguments) arguments at: anInteger
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typInfTypeForArgumentAt: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile |
	self
		typInfTypeReset;
		doSemanticAnalysis;
		propertyAt: #typFixPoint put: false.
	iterations := 0.
	maxIterations := 5.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typInfTemporaryProfile.
	[ | oldTemporaryProfile |
	iterations := iterations + 1.
	oldTemporaryProfiles add: newTemporaryProfile.
	self typInfTypeReset.
	newTemporaryProfile
		do: [ :e | e key propertyAt: #typInfType put: e value ].
	(self allChildren
		copyWithoutAll: (newTemporaryProfile collect: #key) , {self})
		do: [ :e | e typInfType ].
	(newTemporaryProfile collect: #key)
		do: [ :e | 
			e
				typInfTypeReset;
				typInfType ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typInfTemporaryProfile.
	oldTemporaryProfile = newTemporaryProfile
		ifTrue: [ self propertyAt: #typFixPoint put: true ].
	(oldTemporaryProfiles includes: newTemporaryProfile) not
		and: [ iterations < maxIterations ] ] whileTrue.
	^ CompiledMethod
		typAsFunctionTypeWithResult: self typInfResult
		arguments: self typInfArguments
		argumentsOptional: false
		signalsAlways: self typInfSignalsAlways
]
