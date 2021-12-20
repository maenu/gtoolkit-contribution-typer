Class {
	#name : #TypSuperType,
	#superclass : #TypType,
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypSuperType >> > aType [

	^ superType >= aType
]

{ #category : #polymorphic }
TypSuperType >> arguments [

	^ superType arguments
]

{ #category : #polymorphic }
TypSuperType >> at: aString [

	^ superType at: aString
]

{ #category : #initialization }
TypSuperType >> initialize [

	<typPraVariable: 'value' as: '{!,Object}'>
	<typPraVariable: 'superType' as: 'TypType'>
	super initialize.
	self initializeSuperType: ProtoObject typAsType
]

{ #category : #invalidation }
TypSuperType >> isAffectedByClassChange: aClassAnnouncement [

	^ superType isAffectedByClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypSuperType >> isAffectedByMethodChange: aMethodAnnouncement [

	^ superType isAffectedByMethodChange: aMethodAnnouncement
]

{ #category : #polymorphic }
TypSuperType >> result [

	^ superType result
]
