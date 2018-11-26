Class {
	#name : #TypDynTypes,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #copying }
TypDynTypes >> , aClasses [
	| copy |
	copy := self copy.
	aClasses do: [ :e | copy add: e ].
	^ copy
]

{ #category : #enumerating }
TypDynTypes >> add: anAssociation [
	| n |
	n := dictionary at: anAssociation key ifAbsentPut: [ 0 ].
	^ dictionary at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
TypDynTypes >> addAll: aTypes [
	^ aTypes do: [ :e | self add: e ]
]

{ #category : #converting }
TypDynTypes >> asType [
	| remains |
	remains := dictionary keys asSet copy.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	^ remains typAsCompatibleType
]

{ #category : #enumerating }
TypDynTypes >> collect: aBlock [
	| copy |
	copy := TypDynTypes new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #accessing }
TypDynTypes >> dictionary [
	^ dictionary
]

{ #category : #accessing }
TypDynTypes >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #enumerating }
TypDynTypes >> do: aBlock [
	dictionary associationsDo: aBlock
]

{ #category : #'as yet unclassified' }
TypDynTypes >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #'as yet unclassified' }
TypDynTypes >> gtItemsFor: aView [
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #accessing }
TypDynTypes >> increment: anObject [
	| n |
	n := dictionary at: anObject ifAbsentPut: [ 0 ].
	^ dictionary at: anObject put: n + 1
]

{ #category : #accessing }
TypDynTypes >> initialize [
	super initialize.
	dictionary := Dictionary new
]

{ #category : #testing }
TypDynTypes >> isEmpty [
	^ dictionary isEmpty
]

{ #category : #'as yet unclassified' }
TypDynTypes >> postCopy [
	super postCopy.
	dictionary := dictionary copy
]

{ #category : #enumerating }
TypDynTypes >> select: aBlock [
	| copy |
	copy := TypDynTypes new.
	dictionary
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #accessing }
TypDynTypes >> size [
	^ dictionary isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ dictionary sum ]
]

{ #category : #initialization }
TypDynTypes >> summary [
	| summary |
	summary := dictionary associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]
