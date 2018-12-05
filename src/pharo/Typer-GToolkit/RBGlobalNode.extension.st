Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanTypeWithPragma [
	^ self binding isClassVariable or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanTypeWithShadow [
	^ true
]
