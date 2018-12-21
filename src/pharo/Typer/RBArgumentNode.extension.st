Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ self typAnnotateType: ((self whoDefines: self name) typTypeForArgumentNamed: self name)
]
