Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'as yet unclassified' }
TypTypeLookup class >> classDescription: aClassDescription super: aLookup [

	^ self index
		  at: { 
				  aClassDescription.
				  aLookup }
		  ifAbsentPut: [ 
			  self new
				  initializeClassDescription: aClassDescription;
				  initializeSuper: aLookup;
				  yourself ]
]

{ #category : #comparing }
TypTypeLookup >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ classDescription = anObject classDescription
]

{ #category : #copying }
TypTypeLookup >> asSuper [
	childLookup ifNotNil: [ ^ childLookup ].
	self assert: [ self hasSuper ].
	^ childLookup := self class
			classDescription: classDescription superclass
			super: self
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
TypTypeLookup >> invalidateOnClassChange: aClassAnnouncement [

	^ (super invalidateOnClassChange: aClassAnnouncement) or:
		  (classDescription = aClassAnnouncement classAffected or: [ 
			   classDescription inheritsFrom: aClassAnnouncement classAffected ])
]

{ #category : #accessing }
TypTypeLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name.
	super printOn: aStream
]
