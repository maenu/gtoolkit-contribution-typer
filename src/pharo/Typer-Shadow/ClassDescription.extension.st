Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription typAsNamedType
]
