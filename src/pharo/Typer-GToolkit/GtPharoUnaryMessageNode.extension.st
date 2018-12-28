Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [
	<typTypeArgument: 1 as: 'TypGtPharoCompletionStrategy'>
	<typTypeArgument: 2 as: 'RBMessageNode'>
	<typTypeResultAs: 'SequenceableCollection<String<Character>>'>
	| startingText index type clazz |
	index := aStrategy index.
	self selectorPart stopPosition = index
		ifFalse: [ ^ #() ].
	startingText := self selectorPart value.
	type := self parent receiver
		typGtGuessType: aStrategy
		in: anRbNode receiver.
	clazz := type hasClass
		ifTrue: [ type asClass ]
		ifFalse: [ Object ].
	^ (aStrategy selectorsForReceiver: clazz matching: startingText)
		collect:
			[ :e | self actionForSelector: e startingWith: startingText at: index ]
]
