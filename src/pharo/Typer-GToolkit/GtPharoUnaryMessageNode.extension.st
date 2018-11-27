Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: strategy in: anRbNode [
	| startingText index type clazz |
	index := strategy index.
	selectorPart stopPosition = index
		ifFalse: [ ^ #() ].
	startingText := selectorPart value.
	type := parent receiver typGtGuessType: strategy in: anRbNode receiver.
	clazz := type hasClass
		ifTrue: [ type asClass ]
		ifFalse: [ Object ].
	^ (strategy selectorsForReceiver: clazz matching: startingText) collect: [ :each | self actionForSelector: each startingWith: startingText at: index ]
]
