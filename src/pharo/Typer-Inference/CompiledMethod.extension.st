Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsCanResolve [
	self assert: [ self typInfAbsIsCanResolve ].
	^ self pragmas
		select: [ :e | e selector = #typInfAbsCanResolve: ]
		thenCollect: [ :e | e arguments first asSymbol ]
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
	^ self pragmas
		select: [ :e | e selector = #typInfAbsResolve: ]
		thenCollect: [ :e | e arguments first asSymbol ]
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookup [
	| selfType |
	selfType := self methodClass typAsType.
	^ self typInfAsLookupWithSelf: selfType super: selfType superOrNil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookupWithSelf: aType super: anotherType [
	^ TypMethodLookup
		receiver: self methodClass typAsType
		selector: self selector
		arguments: (self selector numArgs typTimesCollect: [ :i | TypUnknownType instance ])
		self: aType
		super: anotherType
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContext [
	^ TypInfIndex instance contextAt: self typInfAsLookup
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	^ self class
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: (self numArgs typTimesCollect: [ :i | TypUnknownType instance ])
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [
	^ {Integer typAsType}
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfUpdateContext [
	^ TypInfIndex instance updateContextAt: self typInfAsLookup
]
