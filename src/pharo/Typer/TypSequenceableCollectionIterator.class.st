Class {
	#name : #TypSequenceableCollectionIterator,
	#superclass : #TypIterator,
	#instVars : [
		'queue'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypSequenceableCollectionIterator >> collection: aSequenceableCollection [
	queue := aSequenceableCollection copy asOrderedCollection
]

{ #category : #accessing }
TypSequenceableCollectionIterator >> hasNext [
	^ queue isNotEmpty
]

{ #category : #accessing }
TypSequenceableCollectionIterator >> next [
	^ queue removeFirst
]
