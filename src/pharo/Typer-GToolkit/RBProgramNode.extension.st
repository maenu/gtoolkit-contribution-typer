Extension { #name : #RBProgramNode }

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtCanType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtInvokedMethods [
	^ self children flatCollect: #typGtInvokedMethods as: IdentitySet
]
