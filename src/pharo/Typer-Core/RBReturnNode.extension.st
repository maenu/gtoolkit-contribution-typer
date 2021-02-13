Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Core' }
RBReturnNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer-Core' }
RBReturnNode >> typTypeRecursive [
	^ self value typType
]
