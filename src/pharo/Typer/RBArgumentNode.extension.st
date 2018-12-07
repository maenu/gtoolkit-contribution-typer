Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ (self whoDefines: self name) typTypeForArgumentNamed: self name
]
