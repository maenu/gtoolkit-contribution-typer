Class {
	#name : #TypSuperType,
	#superclass : #TypType,
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypSuperType >> allSelectors [
	^ self super allSelectors
]

{ #category : #accessing }
TypSuperType >> classDescription [
	^ superType classDescription
]

{ #category : #accessing }
TypSuperType >> contravariant: aType [
	aType isSuper ifTrue: [ ^ self contravariant: aType super ].
	aType <= superType ifTrue: [ ^ aType ].
	^ super contravariant: aType
]

{ #category : #accessing }
TypSuperType >> covariant: aType [
	aType >= superType ifTrue: [ ^ self ].
	^ super covariant: aType
]

{ #category : #invalidation }
TypSuperType >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	^ superType dependsOnClassDescription: aClassDescription
]

{ #category : #invalidation }
TypSuperType >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	^ superType dependsOnCompiledMethod: aCompiledMethod
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
