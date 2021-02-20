Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookup class >> classDescription: aClassDescription [
	^ self new
		initializeClassDescription: aClassDescription;
		yourself
]

{ #category : #comparing }
TypTypeLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ classDescription = anObject classDescription ] ]
]

{ #category : #accessing }
TypTypeLookup >> classDescription [
	<typTypeResultAs: 'ClassDescription'>
	^ classDescription
]

{ #category : #copying }
TypTypeLookup >> copyAsSuper [
	self assert: [ self hasSuper ].
	^ self copy
		initializeClassDescription: classDescription superclass;
		yourself
]

{ #category : #testing }
TypTypeLookup >> hasSuper [
	^ classDescription superclass isNotNil and: [ classDescription superclass ~= classDescription and: [ (classDescription superclass inheritsFrom: classDescription) not ] ]
]

{ #category : #comparing }
TypTypeLookup >> hash [
	^ classDescription hash
]

{ #category : #initialization }
TypTypeLookup >> initialize [
	<typTypeVariable: 'classDescription' as: 'ClassDescription'>
	super initialize
]

{ #category : #accessing }
TypTypeLookup >> initializeClassDescription: anObject [
	<typTypeArgument: 1 as: 'ClassDescription'>
	classDescription := anObject
]

{ #category : #accessing }
TypTypeLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name
]
