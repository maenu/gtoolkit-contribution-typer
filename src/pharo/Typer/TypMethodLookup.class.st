Class {
	#name : #TypMethodLookup,
	#superclass : #TypObjectLookup,
	#instVars : [
		'argumentTypes'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypMethodLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ selector = anObject selector and: [ receiverType = anObject receiverType and: [ argumentTypes = anObject argumentTypes ] ] ] ]
]

{ #category : #accessing }
TypMethodLookup >> argumentTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodLookup >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	argumentTypes := anObject
]

{ #category : #comparing }
TypMethodLookup >> hash [
	^ super hash bitXor: argumentTypes hash
]

{ #category : #initialization }
TypMethodLookup >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'SequenceableCollection<TypType>'>
	super initialize
]

{ #category : #accessing }
TypMethodLookup >> postCopy [
	super postCopy.
	argumentTypes := argumentTypes copy
]
