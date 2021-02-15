Extension { #name : #RBMethodNode }

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
RBMethodNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	self assert: [ compilationContext isNotNil ].
	^ TypMethodLookupIndex instance
		resultTypeFor:
			(TypMethodLookup new
				receiverType: nil;
				selector: self selector asSymbol;
				argumentTypes: (self typTypesForArguments);
				argumentNodes: self arguments;
				yourself)
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
		typAsFunctionTypeWithArguments: self typTypesForArguments
		result: self typTypeForResult
		argumentsOptional: false
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypeReset [
	self removeProperty: #typFixPoint ifAbsent: [  ].
	super typTypeReset
]

{ #category : #'*Typer-Core' }
RBMethodNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
