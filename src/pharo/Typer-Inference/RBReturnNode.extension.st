Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfSignalsAlways [
	^ self value typInfSignalsAlways
]

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfTypeRecursive [
	^ self value typInfType
]
