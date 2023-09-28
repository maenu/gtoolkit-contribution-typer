Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtCompletionActionStreamFor: aStrategy type: aType [
	"replaces GtPharoUnaryMessageNode>>#completionActionStreamFor:
	TypGtPharoCompletionStrategy"

	<typPraArguments: 'TypGtPharoCompletionStrategy,RBMessageNode'>
	selectorPart stopPosition = aStrategy index ifFalse: [ ^ #() asAsyncStream ].
	^ self
		typGtMessageCompletionsSendTo: self receiver
		matching: selectorPart
		parentMessage: self completionKeywordMessage
		for: aStrategy
		type: aType
]

{ #category : #'*Typer-GToolkit' }
GtPharoUnaryMessageNode >> typGtMessageCompletionsSendTo: receiver matching: aToken parentMessage: aMessage for: strategy type: aType [
	"replaces GtPharoProgramNode>>#messageCompletionsSendTo:matching:parentMessage:for:"

	| index name completionsStream replacementsStream wordSelectorStream |
	index := strategy index.
	name := aToken source.
	strategy wasRequested
		ifFalse: [ (aType canLookupMethod: name) ifTrue: [ ^ #() asAsyncStream ] ].
	completionsStream := (strategy selectorStreamForReceiver: aType matching: name)
			collect: [ :each | 
				receiver
					actionForSelector: each
					startingWith: name
					at: index
					strategy: strategy ].
	wordSelectorStream := (strategy
			selectorStreamForReceiver: aType
			matchingWords: name) cached.
	aMessage
		ifNotNil: [ completionsStream := self
					mergeKeywordCompletionsWith: completionsStream
					from: aMessage
					matching: aToken
					preferKeywords: aType <= BlockClosure typAsType
					for: strategy ].
	replacementsStream := wordSelectorStream
			collect: [ :each | 
				(GtCompositeCompletionAction labeled: (strategy labelFor: each withWords: name))
					addAction: (GtDeleteTextCompletionAction
							labeled: ''
							from: aToken startPosition
							to: aToken stopPosition);
					addAction: (receiver
							actionForSelector: each
							startingWith: ''
							at: aToken startPosition - 1
							strategy: strategy) ].
	^ completionsStream merge: replacementsStream
]
