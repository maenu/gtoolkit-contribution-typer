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

{ #category : #converting }
TypSuperType >> asBroader: aType [

	aType isSuper ifFalse: [ ^ super asBroader: aType ].
	self >= aType ifTrue: [ ^ self ].
	self < aType ifTrue: [ ^ aType ].
	^ { 
		  self.
		  aType } typAsType
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
	self initializeSuper: ProtoObject typAsType
]

{ #category : #invalidation }
TypSuperType >> invalidateOnClassChange: aClassAnnouncement [

	^ superType invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypSuperType >> invalidateOnMethodChange: aMethodAnnouncement [

	^ superType invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #testing }
TypSuperType >> isSuper [

	^ true
]

{ #category : #polymorphic }
TypSuperType >> result [

	^ superType result
]

{ #category : #'instance creation' }
TypSuperType >> tighten: aType [

	aType isSuper ifFalse: [ ^ super tighten: aType ].
	self >= aType ifTrue: [ ^ aType ].
	self < aType ifTrue: [ ^ self ].
	^ { 
		  self.
		  aType } typAsType
]

{ #category : #polymorphic }
TypSuperType >> withAt: aString put: aType [

	^ self withSuper: (superType withAt: aString put: aType)
]

{ #category : #polymorphic }
TypSuperType >> withParameters: aCollection [

	^ self withSuper: (superType withParameters: aCollection)
]
