Class {
	#name : #TypTypes,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'Typer-Core'
}

{ #category : #copying }
TypTypes >> , aClasses [
	| copy |
	copy := self copy.
	aClasses do: [ :e | copy add: e ].
	^ copy
]

{ #category : #enumerating }
TypTypes >> add: anAssociation [
	| n |
	n := dictionary at: anAssociation key ifAbsentPut: [ 0 ].
	^ dictionary at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
TypTypes >> collect: aBlock [
	| copy |
	copy := TypTypes new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #accessing }
TypTypes >> dictionary [
	^ dictionary
]

{ #category : #accessing }
TypTypes >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #enumerating }
TypTypes >> do: aBlock [
	dictionary associationsDo: aBlock
]

{ #category : #'as yet unclassified' }
TypTypes >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #'as yet unclassified' }
TypTypes >> gtItemsFor: aView [
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #accessing }
TypTypes >> increment: anObject [
	| n |
	n := dictionary at: anObject ifAbsentPut: [ 0 ].
	^ dictionary at: anObject put: n + 1
]

{ #category : #'as yet unclassified' }
TypTypes >> inferredType [
	| remains current |
	remains := self copy.
	remains dictionary removeKey: nil ifAbsent: [  ].
	remains dictionary ifEmpty: [ TypNoInferrableTypeError signal ].
	self assert: [ remains dictionary keys allSatisfy: [ :e | e isClass ] ].
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
TypTypes >> initialize [
	super initialize.
	dictionary := Dictionary new
]

{ #category : #testing }
TypTypes >> isEmpty [
	^ dictionary isEmpty
]

{ #category : #'as yet unclassified' }
TypTypes >> postCopy [
	super postCopy.
	dictionary := dictionary copy
]

{ #category : #enumerating }
TypTypes >> select: aBlock [
	| copy |
	copy := TypTypes new.
	dictionary
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #accessing }
TypTypes >> size [
	^ dictionary isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ dictionary sum ]
]

{ #category : #initialization }
TypTypes >> summary [
	| summary |
	summary := dictionary associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]
