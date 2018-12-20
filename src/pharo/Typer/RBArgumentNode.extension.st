Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typType [
	^ self isBlockVar
		ifTrue: [ self typTypeRecursive ]
		ifFalse: [ super typType ]
]

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ self typAnnotateType: ((self whoDefines: self name) typTypeForArgumentNamed: self name)
]
