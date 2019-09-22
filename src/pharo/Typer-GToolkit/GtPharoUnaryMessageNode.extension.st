Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [
	<typTypeArgument: 1 as: 'TypGtPharoCompletionStrategy'>
	<typTypeArgument: 2 as: 'RBMessageNode'>
	<typTypeResultAs: 'SequenceableCollection<GtCompletionAction>'>
	| startingText index type clazz |
	index := aStrategy index.
	self selectorPart stopPosition = index
		ifFalse: [ ^ #() "typParameters GtCompletionAction" ].
	startingText := self selectorPart value.
	type := self parent receiver
		typGtGuessType: aStrategy
		in: anRbNode receiver.
	clazz := type representsClassDescription
		ifTrue: [ type classDescription ]
		ifFalse: [ Object ].
	^ (aStrategy selectorsForReceiver: clazz matching: startingText)
		collect:
			[ :e | self actionForSelector: e startingWith: startingText at: index ]
]
