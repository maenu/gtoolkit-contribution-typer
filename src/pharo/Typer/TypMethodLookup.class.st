Class {
	#name : #TypMethodLookup,
	#superclass : #TypObjectLookup,
	#instVars : [
		'argumentTypes'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodLookup >> argumentTypes [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodLookup >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'OrderedCollection<TypType>'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodLookup >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'OrderedCollection<TypType>'>
	super initialize
]

{ #category : #accessing }
TypMethodLookup >> postCopy [
	super postCopy.
	argumentTypes := argumentTypes copy
]
