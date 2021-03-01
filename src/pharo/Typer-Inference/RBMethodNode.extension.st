Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfReceiver [
	self flag: 'FIXME implement'
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTemporaryProfile [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: [ :e | e isVariable or: [ e isReturn ] ])
		collect: [ :e | e -> e typInfType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile visitor types |
	types := (self allChildren select: #isReturn)
		collect: #typInfType
		as: OrderedCollection.
	self lastIsReturn
		ifFalse: [ types add: self typInfReceiver ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
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
		typAsFunctionTypeWithResult: types typAsType
		arguments: (self arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: visitor signalsAlways
]
