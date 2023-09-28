Extension { #name : #RBProgramNode }

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtCanTypeIn: aContext [
	^ false
]

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtInvokedMethods [
	^ self children flatCollect: #typGtInvokedMethods as: IdentitySet
]
