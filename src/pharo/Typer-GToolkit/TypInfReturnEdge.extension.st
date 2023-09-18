Extension { #name : #TypInfReturnEdge }

{ #category : #'*Typer-GToolkit' }
TypInfReturnEdge >> typGtColor [
	self isDisabled ifTrue: [ ^ BrGlamorousColors neutralBackgroundColor ].
	^ BrGlamorousColors successBackgroundColor
]
