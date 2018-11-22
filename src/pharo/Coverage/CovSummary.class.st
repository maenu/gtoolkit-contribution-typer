Class {
	#name : #CovSummary,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'stack'
	],
	#category : #'Coverage-Core'
}

{ #category : #copying }
CovSummary >> , aSummary [
	| copy |
	copy := self copy.
	aSummary do: [ :e | copy add: e ].
	^ copy
]

{ #category : #enumerating }
CovSummary >> add: anAssociation [
	| n |
	n := dictionary at: anAssociation key ifAbsentPut: [ 0 ].
	^ dictionary at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
CovSummary >> collect: aBlock [
	| copy |
	copy := CovSummary new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #accessing }
CovSummary >> dictionary [
	^ dictionary
]

{ #category : #accessing }
CovSummary >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #enumerating }
CovSummary >> do: aBlock [
	dictionary associationsDo: aBlock
]

{ #category : #'as yet unclassified' }
CovSummary >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #'as yet unclassified' }
CovSummary >> gtItemsFor: aView [
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #accessing }
CovSummary >> increment: anObject [
	| n |
	n := dictionary at: anObject ifAbsentPut: [ 0 ].
	^ dictionary at: anObject put: n + 1
]

{ #category : #'as yet unclassified' }
CovSummary >> inferredClass [
	| remains current |
	dictionary ifEmpty: [ ^ Object ].
	self assert: [ dictionary keys allSatisfy: [ :e | e isClass ] ].
	remains := self copy.
	current := remains dictionary associationAt: (remains summary orderedKeys at: 1).
	remains dictionary removeKey: current key.
	[ remains dictionary isEmpty ]
		whileFalse: [ | next common |
			next := remains dictionary associationAt: (remains summary orderedKeys at: 1).
			remains dictionary removeKey: next key.
			common := current key withAllSuperclasses detect: [ :e | e == next key or: [ next key inheritsFrom: e ] ].
			common == current key
				ifFalse: [ current := common -> (current value + next value).
					remains add: current ] ].
	^ current key
]

{ #category : #accessing }
CovSummary >> initialize [
	super initialize.
	dictionary := Dictionary new.
	stack := Stack new
]

{ #category : #testing }
CovSummary >> isEmpty [
	^ dictionary isEmpty
]

{ #category : #'as yet unclassified' }
CovSummary >> postCopy [
	super postCopy.
	dictionary := dictionary copy.
	stack := stack copy
]

{ #category : #enumerating }
CovSummary >> select: aBlock [
	| copy |
	copy := CovSummary new.
	dictionary
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #accessing }
CovSummary >> size [
	^ dictionary isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ dictionary sum ]
]

{ #category : #accessing }
CovSummary >> stack [
	^ stack
]

{ #category : #initialization }
CovSummary >> summary [
	| summary |
	summary := dictionary associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]
