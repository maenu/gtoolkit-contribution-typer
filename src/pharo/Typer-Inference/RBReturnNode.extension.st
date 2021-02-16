Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer-Inference' }
RBReturnNode >> typTypeRecursive [
	^ self value typType
]
