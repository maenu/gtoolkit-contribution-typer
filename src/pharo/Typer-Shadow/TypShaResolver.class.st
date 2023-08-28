Class {
	#name : #TypShaResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaResolver >> resolve: aLookup reduce: aCollection [
	aCollection ifEmpty: [ ^ TypUnknownType instance ].
	self flag: 'TODO make more of alternatives instead of just taking first'.
	^ aCollection asOrderedCollection sort first
]
