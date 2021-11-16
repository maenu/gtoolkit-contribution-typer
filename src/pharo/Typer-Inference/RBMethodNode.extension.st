Extension { #name : 'RBMethodNode' }

{ #category : '*Typer-Inference' }
RBMethodNode >> typInfArgumentType: anArgumentNode [
	| i |
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ self typInfMethod arguments at: i
]

{ #category : '*Typer-Inference' }
RBMethodNode >> typInfMethod [

	<typPraResult: 'TypFunctionType'>
	| identifier |
	identifier := 'typInfMethod-' , TypInfSelf value hash asString.
	^ self
		  propertyAt: identifier
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: identifier put: self typInfUnknown;
				  propertyAt: identifier put: (TypInfSelf value
						   lookupMethod: selector asSymbol
						   arguments: (arguments collect: #typInfType)) ]
]

{ #category : '*Typer-Inference' }
RBMethodNode >> typInfTemporaryProfile [
	<typPraResult: 'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ self allChildren
		select: [ :e | e children isEmpty ]
		thenCollect: [ :e | e -> e typInfType ]
]

{ #category : '*Typer-Inference' }
RBMethodNode >> typInfTypeRecursive [

	<typPraResult: 'TypType'>
	|  visitor types identifier |
	identifier := TypInfSelf value hash asString.
	body
		typInfInvalidate;
		typInfType.
	types := (self allChildren select: #isReturn)
		         collect: #typInfType
		         as: OrderedCollection.
	self lastIsReturn ifFalse: [ types add: TypInfSelf value ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		  typAsFunctionTypeWithResult: types typAsType
		  arguments: (arguments collect: #typInfType)
		  argumentsOptional: false
		  signalsAlways: visitor signalsAlways
]

{ #category : '*Typer-Inference' }
RBMethodNode >> typInfTypeRecursiveOld [

	<typPraResult: 'TypType'>
	| iterations maxIterations oldTemporaryProfiles newTemporaryProfile visitor types identifier |
	identifier := TypInfSelf value hash asString.
	self
		typInfInvalidate;
		propertyAt: 'typFixPoint-' , identifier put: false.
	iterations := 0.
	maxIterations := 3.
	oldTemporaryProfiles := Set new.
	newTemporaryProfile := self typInfTemporaryProfile.
	[ 
	| oldTemporaryProfile |
	iterations := iterations + 1.
	oldTemporaryProfiles add: newTemporaryProfile.
	self typInfInvalidate.
	newTemporaryProfile do: [ :e | 
		e value isUnknown ifFalse: [ 
			e key propertyAt: 'typInfType-' , identifier put: e value ] ].
	(self allChildren copyWithoutAll:
		 (newTemporaryProfile collect: #key) , { self }) do: #typInfType.
	(newTemporaryProfile collect: #key) do: [ :e | 
		e
			typInfInvalidate;
			typInfType ].
	oldTemporaryProfile := newTemporaryProfile.
	newTemporaryProfile := self typInfTemporaryProfile.
	oldTemporaryProfile = newTemporaryProfile ifTrue: [ 
		self propertyAt: 'typFixPoint-' , identifier put: true ].
	(oldTemporaryProfiles includes: newTemporaryProfile) not and: [ 
		iterations < maxIterations ] ] whileTrue.
	types := (self allChildren select: #isReturn)
		         collect: #typInfType
		         as: OrderedCollection.
	self lastIsReturn ifFalse: [ types add: TypInfSelf value ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		  typAsFunctionTypeWithResult: types typAsType
		  arguments: (arguments collect: #typInfType)
		  argumentsOptional: false
		  signalsAlways: visitor signalsAlways
]
