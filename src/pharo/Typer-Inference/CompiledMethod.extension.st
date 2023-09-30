Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsCanResolve [
	self assert: [ self typInfAbsIsCanResolve ].
	^ (self pragmas detect: [ :e | e selector = #typInfAbsCanResolve: ]) arguments
		first asSymbol
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsIsCanResolve [
	^ self hasPragmaNamed: #typInfAbsCanResolve:
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsIsResolve [
	^ self hasPragmaNamed: #typInfAbsResolve:
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsResolve [
	self assert: [ self typInfAbsIsResolve ].
	^ (self pragmas detect: [ :e | e selector = #typInfAbsResolve: ])
		arguments first asSymbol
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookup [
	^ TypMethodLookup
		receiver: self methodClass typAsType
		selector: self selector
		arguments: (self selector numArgs
				typTimesCollect: [ :i | TypUnknownType instance ])
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookupSelf: aType super: anotherType [
	^ TypMethodLookup
		receiver: self methodClass typAsType
		selector: self selector
		arguments: (self selector numArgs typTimesCollect: [ TypUnknownType instance ])
		self: aType
		super: anotherType
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	^ self class
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: (self numArgs timesCollect: [ TypUnknownType instance ])
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
