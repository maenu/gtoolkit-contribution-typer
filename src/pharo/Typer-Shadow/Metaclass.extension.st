Extension { #name : #Metaclass }

{ #category : #'*Typer-Shadow' }
Metaclass >> typShaResolve: aSymbol lookup: aLookup [
	^ self instanceSide perform: aSymbol with: aLookup
]
