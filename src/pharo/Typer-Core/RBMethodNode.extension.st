Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Core' }
RBMethodNode >> typArgumentTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typReceiverType [
	self flag: 'FIXME implement'
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typResultType [
	<typTypeResultAs: 'TypType'>
	self assert: [ compilationContext isNotNil ].
	^ TypMethodLookupIndex instance
		resultTypeFor:
			(TypMethodLookup new
				receiverType: nil;
				selector: self selector asSymbol;
				argumentTypes: (self typArgumentTypes);
				argumentNodes: self arguments;
				yourself)
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
RBMethodNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile |
	self
		typTypeReset;
		doSemanticAnalysis;
		propertyAt: #typFixPoint put: false.
	iterations := 0.
	maxIterations := 5.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typTemporaryProfile.
	[ | oldTemporaryProfile |
	iterations := iterations + 1.
	oldTemporaryProfiles add: newTemporaryProfile.
	self typTypeReset.
	newTemporaryProfile
		do: [ :e | e key propertyAt: #typType put: e value ].
	(self allChildren
		copyWithoutAll: (newTemporaryProfile collect: #key) , {self})
		do: [ :e | e typType ].
	(newTemporaryProfile collect: #key)
		do: [ :e | 
			e
				typTypeReset;
				typType ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typTemporaryProfile.
	oldTemporaryProfile = newTemporaryProfile
		ifTrue: [ self propertyAt: #typFixPoint put: true ].
	(oldTemporaryProfiles includes: newTemporaryProfile) not
		and: [ iterations < maxIterations ] ] whileTrue.
	^ CompiledMethod
		typAsFunctionTypeWithArguments: self typArgumentTypes
		result: self typResultType
		argumentsOptional: false
]
