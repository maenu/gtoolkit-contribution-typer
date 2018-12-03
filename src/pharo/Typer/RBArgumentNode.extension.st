Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ (self whoDefines: name) typTypeForArgumentNamed: name
]
