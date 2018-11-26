Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'weights'
	],
	#category : #'Typer-Core'
}

{ #category : #copying }
TypUnionType >> , aClasses [
	| copy |
	copy := self copy.
	aClasses do: [ :e | copy add: e ].
	^ copy
]

{ #category : #comparing }
TypUnionType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ weights keys asSet = anObject weights keys asSet ] ]
]

{ #category : #enumerating }
TypUnionType >> add: anAssociation [
	| n |
	n := weights at: anAssociation key ifAbsentPut: [ 0 ].
	^ weights at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
TypUnionType >> addAll: aTypes [
	^ aTypes do: [ :e | self add: e ]
]

{ #category : #converting }
TypUnionType >> asType [
	| remains |
	remains := weights keys asSet copy.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	^ remains typAsCompatibleType
]

{ #category : #enumerating }
TypUnionType >> collect: aBlock [
	| copy |
	copy := TypUnionType new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #enumerating }
TypUnionType >> do: aBlock [
	weights associationsDo: aBlock
]

{ #category : #'as yet unclassified' }
TypUnionType >> gtInspectorSummaryIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ self summary gtInspectorItemsIn: aComposite
]

{ #category : #'as yet unclassified' }
TypUnionType >> gtItemsFor: aView [
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #comparing }
TypUnionType >> hash [
	^ weights keys asSet hash
]

{ #category : #accessing }
TypUnionType >> increment: anObject [
	| n |
	n := weights at: anObject ifAbsentPut: [ 0 ].
	^ weights at: anObject put: n + 1
]

{ #category : #accessing }
TypUnionType >> initialize [
	super initialize.
	weights := Dictionary new
]

{ #category : #testing }
TypUnionType >> isEmpty [
	^ weights isEmpty
]

{ #category : #'as yet unclassified' }
TypUnionType >> lookupMethodSelector: aSymbol [
	^ self superType lookupMethodSelector: aSymbol
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	aStream << ('|' join: (self summary orderedKeys ifEmpty: [ {TypUnknownType instance} ] ifNotEmpty: [ :e | e collect: #printString ]))
]

{ #category : #enumerating }
TypUnionType >> select: aBlock [
	| copy |
	copy := TypUnionType new.
	weights
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #accessing }
TypUnionType >> size [
	^ weights isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ weights sum ]
]

{ #category : #initialization }
TypUnionType >> summary [
	| summary |
	summary := weights associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains |
	remains := weights keys asSet copy.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	^ remains typAsCompatibleType
]

{ #category : #accessing }
TypUnionType >> weights [
	^ weights
]

{ #category : #accessing }
TypUnionType >> weights: anObject [
	weights := anObject
]
