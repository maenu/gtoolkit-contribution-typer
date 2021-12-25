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
TypSuperType >> invalidateOnClassChange: aClassAnnouncement [

	^ superType invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypSuperType >> invalidateOnMethodChange: aMethodAnnouncement [

	^ superType invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #polymorphic }
TypSuperType >> result [

	^ superType result
]

{ #category : #polymorphic }
TypSuperType >> withAt: aString put: aType [

	<typEdge>
	self flag: 'TODO should use index lookup, not copy'.
	^ self withSuper: (superType withAt: aString put: aType)
]

{ #category : #polymorphic }
TypSuperType >> withParameters: aCollection [

	<typEdge>
	self flag: 'TODO should use index lookup, not copy'.
	^ self withSuper: (superType withParameters: aCollection)
]
