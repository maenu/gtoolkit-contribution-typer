Class {
	#name : #TypBreadthLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypBreadthLookupResolver >> resolve: aLookup [
	^ ((resolvers collect: [ :e | e resolve: aLookup ]) reject: #isNil)
		ifEmpty: [ nil ]
		ifNotEmpty: #first
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers: anObject [
	resolvers := anObject
]
