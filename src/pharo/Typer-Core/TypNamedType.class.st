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
	^ self new
		initializeWithClassDescription: aClassDescription;
		yourself
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #comparing }
TypNamedType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ name = anObject name ] ]
]

{ #category : #comparing }
TypNamedType >> > aType [
	^ self ~= aType
		and: [ aType hasSuperType and: [ self >= aType superType ] ]
]

{ #category : #'as yet unclassified' }
TypNamedType >> canUnderstand: aSymbol [
	^ self hasClassDescription
		and: [ self classDescription canUnderstand: aSymbol ]
]

{ #category : #converting }
TypNamedType >> classDescription [
	self assert: [ self hasClassDescription ].
	^ classDescription
		ifNil: [ classDescription := (name endsWith: ' class')
				ifTrue: [ (name copyFrom: 1 to: name size - ' class' size) asClass classSide ]
				ifFalse: [ (name endsWith: ' classTrait')
						ifTrue: [ (name copyFrom: 1 to: name size - ' classTrait' size) asClass
								classSide ]
						ifFalse: [ name asClass ] ] ]
]

{ #category : #testing }
TypNamedType >> hasClassDescription [
	^ hasClassDescription
		ifNil: [ | clazz_ |
			clazz_ := name.
			(clazz_ endsWith: ' class')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' class' size ].
			(clazz_ endsWith: ' classTrait')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' classTrait' size ].
			hasClassDescription := [ clazz_ asClass.
			true ]
				on: NotFound
				do: [ false ] ]
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ superType isNotNil
		or: [ self hasClassDescription
				and: [ self classDescription superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	<typTypeVariable: 'representsClass' as: '{!,Boolean}'>
	super initialize
]

{ #category : #initialization }
TypNamedType >> initializeSuperTypeWithBindings: aBindings [
	superType := self superType copyWithBindings: aBindings
]

{ #category : #initialization }
TypNamedType >> initializeSuperTypeWithSomeBindings: aBindings [
	superType := self superType copyWithSomeBindings: aBindings
]

{ #category : #accessing }
TypNamedType >> initializeWithClassDescription: aClassDescription [
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

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	superType ifNotNil: [ ^ superType ].
	superType := self classDescription superclass typAsType.
	^ superType
]
