Class {
	#name : #TypCachingResolver,
	#superclass : #TypResolver,
	#instVars : [
		'cache',
		'resolver'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingResolver >> resolver [
	^ resolver
]

{ #category : #accessing }
TypCachingResolver >> resolver: anObject [
	resolver := anObject
]
