Class {
	#name : 'TypGtPharoCompletionStrategy',
	#superclass : 'GtPharoCompletionStrategy',
	#instVars : [
		'coder'
	],
	#category : 'Typer-GToolkit'
}

{ #category : 'accessing' }
TypGtPharoCompletionStrategy >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : 'accessing' }
TypGtPharoCompletionStrategy >> coder: anObject [

	coder := anObject
]

{ #category : 'accessing' }
TypGtPharoCompletionStrategy >> completionActionsFor: aText at: positionInteger max: maxInteger requested: aBoolean [

	| node |
	maxItems := maxInteger.
	index := positionInteger.
	wasRequested := aBoolean.
	node := coder rbAST bestNodeFor: (index to: index).
	^ (self parseSource: aText asString)
		  ifNil: [ #(  ) ]
		  ifNotNil: [ :tree | tree typGtCompletionActionsFor: self in: node ]
]

{ #category : 'private-selector' }
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

{ #category : 'accessing' }
TypGtPharoCompletionStrategy >> typGtAsCompletionStrategy [

	^ self
]
