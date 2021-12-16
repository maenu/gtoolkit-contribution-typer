Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtPharoCompletionStrategy >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> coder: anObject [

	coder := anObject
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> completionActionStreamFor: aText at: positionInteger requested: aBoolean [

	| node |
	index := positionInteger.
	wasRequested := aBoolean.
	node := coder rbAST bestNodeFor: (index to: index).
	^ (self parseSource: aText asString)
		  ifNil: [ #(  ) asAsyncStream ]
		  ifNotNil: [ :tree | 
		  tree typGtCompletionActionStreamFor: self in: node ]
]

{ #category : #'private-selector' }
TypGtPharoCompletionStrategy >> selectorStreamForReceiver: aBehavior matching: aString [

	| tree |
	tree := aBehavior ifNil: [ SelectorCache ] ifNotNil: [ 
		        tree := GtPrefixTree new.
		        aBehavior withAllSuperclasses withIndexDo: [ :e :i | 
			        e selectors do: [ :f | 
				        tree add: f weight: 999 - i "this is an incredible stupid trick to get an inverse order while being above zero, which is apparently required. never do 999 superclasses" ] ].
		        tree ].
	^ tree asyncWeightedStreamStartingWith: aString
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> typGtAsCompletionStrategy [

	^ self
]
