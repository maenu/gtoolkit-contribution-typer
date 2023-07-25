Class {
	#name : #TypShaResolver,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaResolver class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypShaResolver >> resolve: aLookup reduce: aCollection [

	aCollection ifEmpty: [ ^ TypUnknownType instance ].
	aCollection sort.
	self flag:
		'TODO make more of alternatives instead of just taking first'.
	^ aCollection first
]
