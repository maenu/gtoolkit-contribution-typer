Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit-Core'
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
	index := positionInteger.
	wasRequested := aBoolean.
	^ (self parseSource: aText asString)
		ifNil: [ #() asAsyncStream ]
		ifNotNil: [ :tree | 
			tree
				typGtCompletionActionStreamFor: self
				type: ((coder attributeNamed: #typGtContext)
						type: (coder rbAST bestNodeFor: (index to: index))) ]
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> selectorStreamForReceiver: aType matchingWords: aString [
	aType isUnknown
		ifTrue: [ ^ super selectorStreamForReceiver: aType matchingWords: aString ].
	^ (GtPharoIndex current asyncSelectorsForWord: aString)
		select: [ :each | (each beginsWith: aString) not and: [ aType canLookupMethod: each asSymbol ] ]
]

{ #category : #accessing }
TypGtPharoCompletionStrategy >> typGtAsCompletionStrategy [

	^ self
]
