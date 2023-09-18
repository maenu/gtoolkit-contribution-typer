Extension { #name : #TypInfSignalEdge }

{ #category : #'*Typer-GToolkit' }
TypInfSignalEdge >> typGtColor [
	self isDisabled ifTrue: [ ^ BrGlamorousColors neutralBackgroundColor ].
	^ BrGlamorousColors errorBackgroundColor
]
