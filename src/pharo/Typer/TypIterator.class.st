Class {
	#name : #TypIterator,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypIterator >> hasNext [
	self subclassResponsibility
]

{ #category : #accessing }
TypIterator >> next [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypIterator >> whileHasNext: aBlock [
	[ self hasNext ] whileTrue: [ aBlock cull: self next ]
]
