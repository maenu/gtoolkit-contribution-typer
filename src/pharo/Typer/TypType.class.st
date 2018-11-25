Class {
	#name : #TypType,
	#superclass : #Object,
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

{ #category : #testing }
TypType >> hasSuperType [
	^ true
]

{ #category : #comparing }
TypType >> isSubTypeOf: aType [
	^ self allSuperTypes includes: aType
]

{ #category : #'as yet unclassified' }
TypType >> lookupMethodSelector: aSymbol [
	self subclassResponsibility
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
