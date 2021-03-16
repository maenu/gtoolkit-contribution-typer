Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethod [
	^ self
		propertyAt: #typInfMethod
		ifAbsentPut: [ self typInfReceiver
				lookupMethod: selector asSymbol
				arguments: (arguments collect: #typInfType) ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfReceiver [
	^ self
		propertyAt: #typInfReceiver
		ifAbsentPut: [ self methodClass typAsType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTemporaryProfile [
	<typTypeResultAs: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ (self allChildren select: #isValue)
		collect: [ :e | e -> e typInfType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile visitor types |
	self
		typInfTypeReset;
		propertyAt: #typFixPoint put: false.
	iterations := 0.
	maxIterations := 25.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typInfTemporaryProfile.
	[ | oldTemporaryProfile |
	iterations := iterations + 1.
	oldTemporaryProfiles add: newTemporaryProfile.
	self typInfTypeReset.
	newTemporaryProfile
		do: [ :e | 
			e value isUnknown
				ifFalse: [ e key propertyAt: #typInfType put: e value ] ].
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
	types := (self allChildren select: #isReturn)
		collect: #typInfType
		as: OrderedCollection.
	self lastIsReturn
		ifFalse: [ types add: self typInfReceiver ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		typAsFunctionTypeWithResult: types typAsType
		arguments: (arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: visitor signalsAlways
]
