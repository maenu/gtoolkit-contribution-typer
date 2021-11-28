Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArgumentType: anArgumentNode self: aType [

	| i |
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ (self typInfMethodSelf: aType) arguments at: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethod [

	^ self typInfMethodSelf: self typInfSelf
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethodSelf: aType [

	<typPraResult: 'TypFunctionType'>
	| prefix |
	prefix := 'typInf-' , aType hash asString , '-method'.
	^ self
		  propertyAt: prefix
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: prefix put: (self typInfUnknownSelf: aType);
				  propertyAt: prefix put: (aType
						   lookupMethod: selector asSymbol
						   arguments:
							   (arguments collect: [ :e | e typInfTypeSelf: aType ])) ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfOldTemporaryProfileSelf: aType [

	<typPraResult:
	'SequenceableCollection<Association<RBProgramNode,TypType>>'>
	^ self allChildren
		  select: [ :e | e children isEmpty ]
		  thenCollect: [ :e | e -> (e typInfTypeSelf: aType) ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfOldTypeRecursive [

	<typPraResult: 'TypType'>
	| selfType iterations maxIterations oldTemporaryProfiles newTemporaryProfile visitor types identifier |
	selfType := nil.
	identifier := selfType hash asString.
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
	self lastIsReturn ifFalse: [ types add: selfType ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		  typAsFunctionTypeWithResult: types typAsType
		  arguments: (arguments collect: #typInfType)
		  argumentsOptional: false
		  signalsAlways: visitor signalsAlways
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfSelf [

	^ self
		  propertyAt: 'typInf-self'
		  ifAbsent: [ 
		  self propertyAt: 'typInf-self' put: self methodClass typAsType ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursiveSelf: aType [

	<typPraResult: 'TypType'>
	| visitor types identifier |
	identifier := aType hash asString.
	body
		typInfInvalidateSelf: aType;
		typInfTypeSelf: aType.
	types := (self allChildren select: #isReturn)
		         collect: [ :e | e typInfTypeSelf: aType ]
		         as: OrderedCollection.
	self lastIsReturn ifFalse: [ types add: aType ].
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ CompiledMethod
		  typAsFunctionTypeWithResult: types typAsType
		  arguments: (arguments collect: [ :e | e typInfTypeSelf: aType ])
		  argumentsOptional: false
		  signalsAlways: visitor signalsAlways
]
