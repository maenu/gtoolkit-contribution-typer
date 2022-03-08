Extension { #name : #IndexedSlot }

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfIsWrittenIn: aCompiledMethod [

	^ aCompiledMethod writesField: index
]

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfNode: aNode [

	^ TypInfInstance node: aNode
]
