Class {
	#name : #TypSuperType,
	#superclass : #TypType,
	#category : #'Typer-Core-Core'
}

{ #category : #comparing }
TypSuperType >> > aType [

	^ superType >= aType
]

{ #category : #accessing }
TypSuperType >> allSelectors [
	^ self super allSelectors
]

{ #category : #accessing }
TypSuperType >> classDescription [
	^ superType classDescription
]

{ #category : #accessing }
TypSuperType >> hasClassDescription [
	^ superType hasClassDescription
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

{ #category : #accessing }
TypSuperType >> overriders: aSymbol [
	^ self super overriders: aSymbol
]

{ #category : #accessing }
TypSuperType >> writers: aVariable [
	^ self super writers: aVariable
]
