Extension { #name : #Class }

{ #category : #'*Typer-Shadow' }
Class >> typShaResolve: aSymbol lookup: aLookup [
	^ self typShaNew typShaPerform: aSymbol with: aLookup
]
