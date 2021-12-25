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
	super = anObject
		ifFalse: [ ^ false ].
	^ classDescription = anObject classDescription
]

{ #category : #copying }
TypTypeLookup >> asSuper [

	<typEdge>
	self assert: [ self hasSuper ].
	self flag: 'TODO no copy, use class-side index'.
	^ self copy
		  initializeSuper: self;
		  initializeClassDescription: classDescription superclass;
		  yourself
]

{ #category : #accessing }
TypTypeLookup >> classDescription [
	<typPraResult: 'ClassDescription'>
	^ classDescription
]

{ #category : #testing }
TypTypeLookup >> hasSuper [

	^ classDescription superclass isNotNil and: [ 
		  classDescription superclass ~= classDescription and: [ 
			  (classDescription superclass inheritsFrom: classDescription) not ] ]
]

{ #category : #comparing }
TypTypeLookup >> hash [
	^ super hash bitXor: classDescription hash
]

{ #category : #initialization }
TypTypeLookup >> initialize [
	<typPraVariable: 'classDescription' as: 'ClassDescription'>
	super initialize
]

{ #category : #accessing }
TypTypeLookup >> initializeClassDescription: anObject [
	<typPraArguments: 'ClassDescription'>
	classDescription := anObject
]

{ #category : #invalidation }
TypTypeLookup >> isAffectedByClassChange: aClassAnnouncement [

	^ classDescription = aClassAnnouncement classAffected or: [ 
		  classDescription inheritsFrom: aClassAnnouncement classAffected ]
]

{ #category : #accessing }
TypTypeLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name.
	super printOn: aStream
]
