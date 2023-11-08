Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#instVars : [
		'coderViewModel'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtPharoCompletionStrategy >> coderViewModel: aCoderViewModel [
	coderViewModel := aCoderViewModel
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> completionActionStreamFor: aText at: positionInteger requested: aBoolean [
	index := positionInteger.
	wasRequested := aBoolean.
	^ (self parseSource: aText asString)
		ifNil: [ #() asAsyncStream ]
		ifNotNil: [ :n | 
			| context |
			context := coderViewModel typGtContext.
			n
				typGtCompletionActionStreamFor: self
				type: (context type: (context node bestNodeFor: (index to: index))) ]
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> selectorStreamForReceiver: aType matchingWords: aString [
	aType isUnknown
		ifTrue: [ ^ super selectorStreamForReceiver: aType matchingWords: aString ].
	^ (GtPharoIndex current asyncSelectorsForWord: aString)
		select: [ :each | (each beginsWith: aString) not and: [ aType canLookupMethod: each asSymbol ] ]
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> typGtAsCompletionStrategyIn: aCoderViewModel [
	^ self
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> typGtAsPharoCompletionStrategyIn: aCoderViewModel [
	"kind of a copy as subinstance"

	| strategy |
	strategy := GtPharoCompletionStrategy new.
	(strategy class withAllSuperclasses flatCollect: #instVarNames)
		do: [ :e | strategy instVarNamed: e put: (self instVarNamed: e) ].
	^ strategy
]
