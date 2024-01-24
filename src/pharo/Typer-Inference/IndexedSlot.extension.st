Extension { #name : #IndexedSlot }

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfNode: aNode context: aContext [

	^ TypInfInstance node: aNode context: aContext
]
