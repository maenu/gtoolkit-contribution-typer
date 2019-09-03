Extension { #name : #Collection }

{ #category : #'*Typer-Dynamic' }
Collection >> typSelfType [
	^ super typSelfType
		asParametricType: {(self collect: [ :e | e class typAsType ]) typAsType}
]
