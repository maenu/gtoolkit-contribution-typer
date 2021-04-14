Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #private }
TypGtPharoCompletionStrategy >> actionsFor: aGtAst at: anInteger [
	| gtNode rbPosition rbNode |
	gtNode := self nodeFor: anInteger in: aGtAst.
	rbPosition := anInteger - gtNode source size.
	rbNode := coder rbAST bestNodeFor: (rbPosition to: rbPosition).
	^ gtNode ifNil: [ #() "typParameters GtCompletionAction" ] ifNotNil: [ :node | node typGtCompletionActionsFor: self in: rbNode ]
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> coder: anObject [
	<typPraArguments: 'TypGtMethodCoder'>
	coder := anObject
]

{ #category : #'private-selector' }
TypGtPharoCompletionStrategy >> selectorsForReceiver: aBehavior matching: aString [
	| tree |
	tree := aBehavior
		ifNil: [ SelectorCache ]
		ifNotNil: [ tree := GtPrefixTree new.
			aBehavior withAllSuperclasses
				withIndexDo: [ :e :i | 
					e selectors
						do:
							[ :f | tree add: f weight: 999 - i	"this is an incredible stupid trick to get an inverse order while being above zero, which is apparently required. never do 999 superclasses" ] ].
			tree ].
	^ tree weightedFirst: maxItems startingWith: aString
]

{ #category : #'as yet unclassified' }
TypGtPharoCompletionStrategy >> typGtAsTypGtPharoCompletionStrategyFor: aCoder [
	^ self
		coder: aCoder;
		yourself
]
