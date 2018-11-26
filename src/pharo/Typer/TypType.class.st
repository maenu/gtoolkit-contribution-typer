Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'nullable'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypType >> < aType [
	^ self isSubTypeOf: aType
]

{ #category : #comparing }
TypType >> <= aType [
	^ self = aType or: [ self < aType ]
]

{ #category : #comparing }
TypType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable ] ]
]

{ #category : #comparing }
TypType >> > aType [
	^ aType isSubTypeOf: self
]

{ #category : #comparing }
TypType >> >= aType [
	^ self = aType or: [ self > aType ]
]

{ #category : #'as yet unclassified' }
TypType >> allSuperTypes [
	^ self hasSuperType
		ifTrue: [ | temp |
			temp := self superType allSuperTypes.
			temp addFirst: self superType.
			temp ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #converting }
TypType >> asClass [
	self subclassResponsibility
]

{ #category : #testing }
TypType >> hasClass [
	^ false
]

{ #category : #testing }
TypType >> hasSuperType [
	^ true
]

{ #category : #comparing }
TypType >> hash [
	^ nullable hash
]

{ #category : #initialization }
TypType >> initialize [
	super initialize.
	nullable := false
]

{ #category : #testing }
TypType >> isNil [
	^ false
]

{ #category : #comparing }
TypType >> isSubTypeOf: aType [
	^ self allSuperTypes includes: aType
]

{ #category : #testing }
TypType >> isUnknown [
	^ false
]

{ #category : #accessing }
TypType >> nullable [
	^ nullable
]

{ #category : #accessing }
TypType >> nullable: anObject [
	nullable := anObject
]

{ #category : #printing }
TypType >> printOn: aStream [
	nullable
		ifTrue: [ aStream << '! ' ]
]

{ #category : #accessing }
TypType >> superType [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypType >> withAllSuperTypes [
	| superTypes |
	superTypes := self allSuperTypes.
	superTypes addFirst: self.
	^ superTypes
]
