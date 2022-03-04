Extension { #name : #IndexedSlot }

{ #category : #'*Typer-Inference' }
IndexedSlot >> typInfIsWrittenIn: aCompiledMethod [

	^ aCompiledMethod writesField: index
]
