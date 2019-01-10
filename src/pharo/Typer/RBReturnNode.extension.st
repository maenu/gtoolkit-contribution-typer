Extension { #name : #RBReturnNode }

{ #category : #'*Typer' }
RBReturnNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer' }
RBReturnNode >> typTypeRecursive [
	^ self value typType
]
