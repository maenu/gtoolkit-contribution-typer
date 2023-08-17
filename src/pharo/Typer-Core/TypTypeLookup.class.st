Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookup class >> classDescription: aClassDescription parent: aLookup [

	^ self index
		  at: { 
				  aClassDescription.
				  aLookup }
		  ifAbsentPut: [ 
			  self new
				  initializeClassDescription: aClassDescription;
				  initializeParent: aLookup;
				  yourself ]
]

{ #category : #comparing }
TypTypeLookup >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ classDescription = anObject classDescription
]

{ #category : #copying }
TypTypeLookup >> asParent [
	child ifNotNil: [ ^ child ].
	self assert: [ self hasParent ].
	^ child := self class
			classDescription: classDescription superclass
			parent: self
]

{ #category : #accessing }
TypTypeLookup >> classDescription [
	<typPraResult: 'ClassDescription'>
	^ classDescription
]

{ #category : #testing }
TypTypeLookup >> hasParent [
	^ classDescription superclass isNotNil
		and: [ classDescription superclass ~= classDescription
				and: [ (classDescription superclass inheritsFrom: classDescription) not ] ]
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
