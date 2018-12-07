Class {
	#name : #TypDynResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynResolver >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver>'>
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #accessing }
TypDynResolver >> resolvers [
	<typTypeResultAs: 'SequenceableCollection<TypResolver>'>
	^ resolvers
]

{ #category : #accessing }
TypDynResolver >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypResolver>'>
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
