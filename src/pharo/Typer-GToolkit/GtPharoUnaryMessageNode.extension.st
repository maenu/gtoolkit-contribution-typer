Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [

	<typPraResult: 'SequenceableCollection<GtCompletionAction>'>
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBMessageNode'>
	| startingText index type clazz |
	index := aStrategy index.
	selectorPart stopPosition = index ifFalse: [ 
		^ #(  ) "typParameters GtCompletionAction" ].
	startingText := selectorPart value.
	type := anRbNode typInfType.
	self flag: 'TODO can be less restrictive here'.
	clazz := (type isNamed and: [ type hasClassDescription ])
		         ifTrue: [ type classDescription ]
		         ifFalse: [ Object ].
	^ (aStrategy selectorsForReceiver: clazz matching: startingText) 
		  collect: [ :each | 
			  parent
				  actionForSelector: each
				  startingWith: startingText
				  at: index
				  needsParensKeywords: parent parent needsParenthesisForKeyword ]
]
