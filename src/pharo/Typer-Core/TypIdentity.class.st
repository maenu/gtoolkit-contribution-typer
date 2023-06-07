Class {
	#name : #TypIdentity,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypIdentity class >> object: anObject [

	^ self
		  new;
		  initializeObject: anObject;
		  yourself
]

{ #category : #comparing }
TypIdentity >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	^ anObject object = object
]

{ #category : #comparing }
TypIdentity >> hash [

	^ object identityHash
]

{ #category : #initialization }
TypIdentity >> initializeObject: anObject [

	object := anObject
]
