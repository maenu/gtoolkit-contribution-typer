Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ (self whoDefines: name) typTypeForArgumentNamed: name withDiscovered: aDictionary
]
