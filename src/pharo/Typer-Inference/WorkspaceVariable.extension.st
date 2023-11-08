Extension { #name : #WorkspaceVariable }

{ #category : #'*Typer-Inference' }
WorkspaceVariable >> typInfNode: aNode context: aContext [
	^ TypInfWorkspace node: aNode context: aContext
]
