Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Core' }
RBReturnNode >> typSignalsAlwaysIn: aContext [
	^ self value typSignalsAlwaysIn: aContext
]

{ #category : #'*Typer-Core' }
RBReturnNode >> typTypeRecursiveIn: aContext [
	^ self value typTypeIn: aContext
]
