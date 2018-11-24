Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: strategy in: anRbNode [
	| startingText index |
	index := strategy index.
	selectorPart stopPosition = index
		ifFalse: [ ^ #() ].
	startingText := selectorPart value.
	^ (strategy selectorsForReceiver: (parent receiver typGtGuessType: strategy in: anRbNode receiver) matching: startingText)
		collect: [ :each | self actionForSelector: each startingWith: startingText at: index ]
]
