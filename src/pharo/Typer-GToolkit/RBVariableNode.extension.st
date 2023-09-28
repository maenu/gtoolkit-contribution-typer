Extension { #name : #RBVariableNode }

{ #category : #'*Typer-GToolkit' }
RBVariableNode >> typGtCanTypeIn: aContext [
	^ variable typGtCanTypeIn: aContext
]

{ #category : #'*Typer-GToolkit' }
RBVariableNode >> typGtShadowMethodIn: aContext [
	self flag: 'FIXME'.
	^ variable typGtShadowMethodIn: aContext
]
