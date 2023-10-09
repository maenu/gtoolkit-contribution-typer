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
		arguments: (self selector numArgs typTimesCollect: [ :i | TypUnknownType instance ])
		self: aType
		super: anotherType
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContext [
	^ TypInfIndex instance context: self
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContextAsyncBy: aBlock for: aDuration [
	^ TypInfIndex instance
		contextAsync: self
		by: aBlock
		for: aDuration
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContextAsyncWithTallyBy: aBlock for: aDuration [
	^ TypInfIndex instance
		contextAsyncWithTally: self
		by: aBlock
		for: aDuration
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContextBy: aBlock [
	^ TypInfIndex instance context: self by: aBlock
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfContextIfPresent: aBlock ifAbsent: anotherBlock [
	^ TypInfIndex instance
		context: self typInfAsLookup
		ifPresent: aBlock
		ifAbsent: anotherBlock
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
