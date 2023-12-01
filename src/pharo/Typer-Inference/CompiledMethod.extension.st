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
CompiledMethod >> typInfMethodLookup [
	| selfType selector |
	selfType := self methodClass typAsType.
	selector := self selector.
	^ TypMethodLookup
		receiver: selfType
		selector: selector
		arguments: selector typInfUnknownArguments
		self: selfType
		super: selfType superOrNil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	^ self class
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: self selector typInfUnknownArguments
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [
	^ {Integer typAsType}
]
