Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [
	<typPraResult: 'SequenceableCollection<GtCompletionAction>'>
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBMessageNode'>
	| startingText index type clazz |
	index := aStrategy index.
	self selectorPart stopPosition = index
		ifFalse: [ ^ #()	"typParameters GtCompletionAction" ].
	startingText := self selectorPart value.
	type := self parent receiver
		typGtGuessType: aStrategy
		in: anRbNode receiver.
	clazz := (type isNamed and: [ type hasClassDescription ])
		ifTrue: [ type classDescription ]
		ifFalse: [ Object ].
	^ (aStrategy selectorsForReceiver: clazz matching: startingText)
		collect:
			[ :e | self actionForSelector: e startingWith: startingText at: index ]
]
