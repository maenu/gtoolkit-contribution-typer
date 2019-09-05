Class {
	#name : #TypIteratorIterator,
	#superclass : #TypIterator,
	#instVars : [
		'current',
		'iterators'
	],
	#category : #'Typer-Core'
}

{ #category : #testing }
TypIteratorIterator >> hasNext [
	^ current hasNext
]

{ #category : #initialization }
TypIteratorIterator >> initialize [
	super initialize.
	current := #() typAsIterator.
	iterators := #()
]

{ #category : #scrolling }
TypIteratorIterator >> invalidate [
	[ current hasNext or: [ iterators isEmpty ] ]
		whileFalse: [ current := iterators removeFirst ]
]

{ #category : #accessing }
TypIteratorIterator >> iterators: anOrderedCollection [
	current := #() typAsIterator.
	iterators := anOrderedCollection copy.
	self invalidate
]

{ #category : #testing }
TypIteratorIterator >> next [
	| next |
	next := current next.
	self invalidate.
	^ next
]
