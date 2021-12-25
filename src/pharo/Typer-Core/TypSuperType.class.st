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

{ #category : #polymorphic }
TypSuperType >> withAt: aString put: aType [

	^ self
		  outgoingAt: { 
				  #withAt:put:.
				  aString.
				  aType }
		  ifAbsentPut: [ 
			  self flag: 'TODO should use index lookup, not copy'.
			  self withSuper: (superType withAt: aString put: aType) ]
]

{ #category : #polymorphic }
TypSuperType >> withParameters: aCollection [

	^ self
		  outgoingAt: { 
				  #withParameters:.
				  aCollection }
		  ifAbsentPut: [ 
			  self flag: 'TODO should use index lookup, not copy'.
			  self withSuper: (superType withParameters: aCollection) ]
]
