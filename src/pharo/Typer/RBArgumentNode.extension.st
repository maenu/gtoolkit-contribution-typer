Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typType [
	^ (self whoDefines: self name) isBlock
		ifTrue: [ self typTypeRecursive ]
		ifFalse: [ super typType ]
]

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ self typAnnotateType: ((self whoDefines: self name) typTypeForArgumentNamed: self name)
]
