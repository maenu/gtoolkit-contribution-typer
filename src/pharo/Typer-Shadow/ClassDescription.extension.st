Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaResolve: aSymbol lookup: aLookup [
	^ self typShaNew typShaPerform: aSymbol with: aLookup
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
]
