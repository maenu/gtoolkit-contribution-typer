Extension { #name : #RBReturnNode }

{ #category : #'*Typer' }
RBReturnNode >> typIsReturnOnly [
	^ true
]

{ #category : #'*Typer' }
RBReturnNode >> typIsSignal [
	^ self value typIsSignal
]

{ #category : #'*Typer' }
RBReturnNode >> typTypeRecursive [
	^ self value typType
]
