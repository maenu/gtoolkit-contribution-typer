Class {
	#name : #TypDynResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynResolver >> resolverFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'TypResolver<TypLookup>'>
	^ self
]

{ #category : #accessing }
TypDynResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypDynResolver >> resolvers: anObject [
	resolvers := anObject
]

{ #category : #accessing }
TypDynResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'Boolean'>
	^ false
]
