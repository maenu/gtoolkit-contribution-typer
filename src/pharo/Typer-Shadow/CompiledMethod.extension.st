Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaCanResolveMethodSelector: aSymbol [
	self typShaIsResolveMethod ifFalse: [ ^ false ].
	^ self typShaResolvedMethodSelector = aSymbol
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaCanResolveVariableSelector: aSymbol [
	self typShaIsResolveVariable ifFalse: [ ^ false ].
	^ self typShaResolvedVariableSelector = aSymbol
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaIsResolveMethod [
	^ self hasPragmaNamed: #typShaMethod:
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaIsResolveType [
	^ self hasPragmaNamed: #typShaType
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaIsResolveVariable [
	^ self hasPragmaNamed: #typShaVariable:
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaResolvedMethod [
	self assert: [ self typShaIsResolveMethod ].
	^ self methodClass lookupSelector: self typShaResolvedMethodSelector
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaResolvedMethodSelector [
	self assert: [ self typShaIsResolveMethod ].
	^ (self pragmas detect: [ :e | e selector = #typShaMethod: ]) arguments first asSymbol
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaResolvedVariableSelector [
	self assert: [ self typShaIsResolveVariable ].
	^ (self pragmas detect: [ :e | e selector = #typShaVariable: ]) arguments first
		asSymbol
]
