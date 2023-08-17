Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
]
