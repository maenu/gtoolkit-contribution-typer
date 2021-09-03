Class {
	#name : #TypOrigin,
	#superclass : #Object,
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypOrigin >> = anObject [
	anObject == self
		ifTrue: [ ^ true ].
	^ anObject class = self class
]

{ #category : #accessing }
TypOrigin >> hash [
	^ self class hash
]

{ #category : #invalidation }
TypOrigin >> invalidate [

	
]
