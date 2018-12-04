Class {
	#name : #TypDynResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypDynResolver >> resolvers: anObject [
	resolvers := anObject
]

{ #category : #accessing }
TypDynResolver >> resolversFor: aLookup [
	^ {(resolvers at: aLookup receiverType asClass -> aLookup selector)}
]

{ #category : #accessing }
TypDynResolver >> resolves: aLookup [
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	^ resolvers includesKey: aLookup receiverType asClass -> aLookup selector
]
