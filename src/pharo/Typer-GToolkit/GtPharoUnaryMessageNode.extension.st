Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionStreamFor: aStrategy in: anRbNode [

	<typPraArguments: 'TypGtPharoCompletionStrategy,RBMessageNode'>
	| startingText index type clazz |
	index := aStrategy index.
	selectorPart stopPosition = index ifFalse: [ ^ #(  ) asAsyncStream ].
	startingText := selectorPart value.
	type := anRbNode typInfTypeInSelf.
	self flag: 'TODO can be less restrictive here'.
	clazz := (type isNamed and: [ type hasClassDescription ])
		         ifTrue: [ type classDescription ]
		         ifFalse: [ Object ].
	^ ((aStrategy selectorsForReceiver: clazz matching: startingText) 
		   collect: [ :each | 
			   parent
				   actionForSelector: each
				   startingWith: startingText
				   at: index
				   needsParensKeywords: parent parent needsParenthesisForKeyword ])
		  asAsyncStream
]
