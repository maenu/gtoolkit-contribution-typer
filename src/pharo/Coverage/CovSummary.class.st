Class {
	#name : #CovSummary,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #Coverage
}

{ #category : #accessing }
CovSummary >> add: anObject [
	| n |
	n := dictionary at: anObject ifAbsentPut: [ 0 ].
	^ dictionary at: anObject put: n + 1
]

{ #category : #accessing }
CovSummary >> dictionary [
	^ dictionary
]

{ #category : #accessing }
CovSummary >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #'as yet unclassified' }
CovSummary >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #'as yet unclassified' }
CovSummary >> gtItemsFor: aView [
	<gtView>
	
	^ dictionary gtItemsFor: aView
]

{ #category : #accessing }
CovSummary >> initialize [
	super initialize.
	dictionary := Dictionary new
]

{ #category : #accessing }
CovSummary >> size [
	^ dictionary size
]

{ #category : #initialization }
CovSummary >> summary [
	| summary |
	summary := dictionary associations.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]
