Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArgumentType: anArgumentNode [
	| i |
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ self typInfMethod argumentAt: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethod [
	^ self
		propertyAt: 'typInfMethod-' , TypInfSelf value asString
		ifAbsentPut: [ TypInfSelf value
				lookupMethod: selector asSymbol
				arguments: (arguments collect: #typInfType) ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTemporaryProfile [
	<typPraResult: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ self allChildren
		select: [ :e | e children isEmpty ]
		thenCollect: [ :e | e -> e typInfType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursive [
	<typPraResult: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile visitor types |
	self
		typInfTypeReset;
		propertyAt: #typFixPoint , '-' , TypInfSelf value asString
			put: false.
	iterations := 0.
	maxIterations := 3.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typInfTemporaryProfile.
	[ | oldTemporaryProfile |
	iterations := iterations + 1.
	oldTemporaryProfiles add: newTemporaryProfile.
	self typInfTypeReset.
	newTemporaryProfile
		do: [ :e | 
			e value isUnknown
				ifFalse: [ e key
						propertyAt: #typInfType , '-' , TypInfSelf value asString
						put: e value ] ].
	(self allChildren
		copyWithoutAll: (newTemporaryProfile collect: #key) , {self})
		do: #typInfType.
	(newTemporaryProfile collect: #key)
		do: [ :e | 
			e
				typInfTypeReset;
				typInfType ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typInfTemporaryProfile.
	oldTemporaryProfile = newTemporaryProfile
		ifTrue: [ self
				propertyAt: #typFixPoint , '-' , TypInfSelf value asString
				put: true ].
	(oldTemporaryProfiles includes: newTemporaryProfile) not
		and: [ iterations < maxIterations ] ] whileTrue.
	types := (self allChildren select: #isReturn)
		collect: #typInfType
		as: OrderedCollection.
	self lastIsReturn
		ifFalse: [ types add: TypInfSelf value ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		typAsFunctionTypeWithResult: types typAsType
		arguments: (arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: visitor signalsAlways
]
