Extension { #name : #IndexedSlot }

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfIsWrittenIn: aCompiledMethod [

	^ aCompiledMethod writesField: index
]

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfNode: aNode context: aContext [

	^ TypInfInstance node: aNode context: aContext
]
