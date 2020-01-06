Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'classDescription',
		'hasClassDescription'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription [
	<typTypeArgument: 1 as: 'ClassDescription'>
	^ self new
		initializeWithClassDescription: aClassDescription;
		yourself
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [
	<typTypeArgument: 1 as: 'String'>
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #comparing }
TypNamedType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ name = (anObject "typCastAs TypNamedType") name ] ]
]

{ #category : #comparing }
TypNamedType >> > aType [
	^ self ~= aType
		and: [ aType hasSuperType and: [ self >= aType superType ] ]
]

{ #category : #accessing }
TypNamedType >> canUnderstand: aSymbol [
	^ self hasClassDescription
		and: [ self classDescription canUnderstand: aSymbol ]
]

{ #category : #converting }
TypNamedType >> classDescription [
	self assert: [ self hasClassDescription ].
	^ classDescription
]

{ #category : #testing }
TypNamedType >> hasClassDescription [
	<typTypeResultAs: 'Boolean'>
	^ hasClassDescription
		ifNil: [ hasClassDescription := [ classDescription := (Character space split: name) first asClass.
			true ]
				on: NotFound
				do: [ false ] ]
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ superType isNotNil
		or: [ self hasClassDescription
				and: [ self classDescription superclass
						ifNil: [ false ]
						ifNotNil: [ :e | 
							superType := e typAsType.
							true ] ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	<typTypeVariable: 'classDescription' as: 'ClassDescription'>
	<typTypeVariable: 'hasClassDescription' as: '{!,Boolean}'>
	super initialize
]

{ #category : #accessing }
TypNamedType >> initializeWithClassDescription: aClassDescription [
	<typTypeArgument: 1 as: 'ClassDescription'>
	classDescription := aClassDescription.
	name := classDescription name.
	hasClassDescription := true
]

{ #category : #accessing }
TypNamedType >> initializeWithName: anObject [
	<typTypeArgument: 1 as: 'String'>
	name := anObject.
	hasClassDescription := nil
]

{ #category : #testing }
TypNamedType >> isNamed [
	^ true
]

{ #category : #'as yet unclassified' }
TypNamedType >> lookupSelector: aSymbol [
	self assert: [ self canUnderstand: aSymbol ].
	^ Set with: (self classDescription lookupSelector: aSymbol)
]

{ #category : #accessing }
TypNamedType >> name [
	<typTypeResultAs: 'String'>
	^ name
]

{ #category : #printing }
TypNamedType >> printOn: aStream [
	aStream << name asString
]
