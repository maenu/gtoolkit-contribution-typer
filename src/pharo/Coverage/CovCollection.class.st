Class {
	#name : #CovCollection,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #Coverage
}

{ #category : #initialization }
CovCollection >> add: anObject [
	collection add: anObject
]

{ #category : #accessing }
CovCollection >> collection [
	^ collection
]

{ #category : #accessing }
CovCollection >> collection: anObject [
	collection := anObject
]

{ #category : #initialization }
CovCollection >> initialize [
	super initialize.
	collection := OrderedCollection new
]

{ #category : #initialization }
CovCollection >> summary [
	| summary |
	summary := (collection groupedBy: #youself) associations collect: [ :e | e key -> e value size ].
	summary associations sort: [ :a :b | a value > b value ].
	^ summary
]
