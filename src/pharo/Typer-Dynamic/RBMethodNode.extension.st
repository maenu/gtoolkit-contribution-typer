Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> printOn: aStream [
	aStream nextPutAll: self sourceCode
]
