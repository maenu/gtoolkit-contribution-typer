Class {
	#name : #CovCollection,
	#superclass : #OrderedCollection,
	#category : #Coverage
}

{ #category : #'as yet unclassified' }
CovCollection >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #initialization }
CovCollection >> summary [
	| summary |
	summary := (self groupedBy: #yourself) associations collect: [ :e | e key -> e value size ].
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]
