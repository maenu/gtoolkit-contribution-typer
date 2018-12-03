Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ (self whoDefines: name) typTypeForArgumentNamed: name
]
