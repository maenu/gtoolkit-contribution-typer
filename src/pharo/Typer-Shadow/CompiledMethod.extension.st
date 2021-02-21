Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaResolvesMethod: aSymbol [
	^ self pragmas
		anySatisfy:
			[ :e | e selector = #typShaMethod: and: [ e arguments first = aSymbol ] ]
]

{ #category : #'*Typer-Shadow' }
CompiledMethod >> typShaResolvesVariable: aSymbol [
	^ self pragmas
		anySatisfy:
			[ :e | e selector = #typShaVariable: and: [ e arguments first = aSymbol ] ]
]
