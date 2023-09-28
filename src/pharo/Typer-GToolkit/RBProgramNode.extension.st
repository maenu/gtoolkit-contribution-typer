Extension { #name : #RBProgramNode }

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtCanTypeIn: aContext [
	^ false
]

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtInvokedMethodsIn: aContext [
	^ self children
		flatCollect: [ :n | n typGtInvokedMethodsIn: aContext ]
		as: IdentitySet
]
