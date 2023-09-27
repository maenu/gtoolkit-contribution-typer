Extension { #name : #TypInfNextEdge }

{ #category : #'*Typer-GToolkit' }
TypInfNextEdge >> typGtColor [
	self isDisabled ifTrue: [ ^ BrGlamorousColors neutralBackgroundColor ].
	^ BrGlamorousColors hoveredButtonTextColor
]
