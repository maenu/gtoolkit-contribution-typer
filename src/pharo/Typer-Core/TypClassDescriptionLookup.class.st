Class {
	#name : #TypClassDescriptionLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypClassDescriptionLookup class >> origin: anOrigin classDescription: aClassDescription [
	^ self new
		initializeOrigin: anOrigin;
		initializeClassDescription: aClassDescription;
		yourself
]

{ #category : #comparing }
TypClassDescriptionLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ classDescription = anObject classDescription ] ]
]

{ #category : #copying }
TypClassDescriptionLookup >> asSuperType [
	self assert: [ self hasSuperType ].
	^ self class
		origin: self asOrigin
		classDescription: classDescription superclass
]

{ #category : #accessing }
TypClassDescriptionLookup >> classDescription [
	<typTypeResultAs: 'ClassDescription'>
	^ classDescription
]

{ #category : #testing }
TypClassDescriptionLookup >> hasSuperType [
	^ classDescription superclass isNotNil and: [ classDescription superclass ~= classDescription and: [ (classDescription superclass inheritsFrom: classDescription) not ] ]
]

{ #category : #comparing }
TypClassDescriptionLookup >> hash [
	^ classDescription hash
]

{ #category : #initialization }
TypClassDescriptionLookup >> initialize [
	<typTypeVariable: 'classDescription' as: 'ClassDescription'>
	super initialize
]

{ #category : #accessing }
TypClassDescriptionLookup >> initializeClassDescription: anObject [
	<typTypeArgument: 1 as: 'ClassDescription'>
	classDescription := anObject
]

{ #category : #accessing }
TypClassDescriptionLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name
]
