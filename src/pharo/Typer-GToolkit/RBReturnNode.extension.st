Extension { #name : #RBReturnNode }

{ #category : #'*Typer-GToolkit' }
RBReturnNode >> sourceNodeForPC: anInteger [
	^ self methodNode bcToASTCache nodeForPC: anInteger
]
