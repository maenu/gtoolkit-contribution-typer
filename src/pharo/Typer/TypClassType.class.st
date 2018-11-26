Class {
	#name : #TypClassType,
	#superclass : #TypType,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypClassType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ clazz = anObject clazz ] ] ]
]

{ #category : #converting }
TypClassType >> asClass [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz: anObject [
	clazz := anObject
]

{ #category : #testing }
TypClassType >> hasClass [
	^ true
]

{ #category : #'as yet unclassified' }
TypClassType >> hasSuperType [
	^ clazz superclass isNotNil or: [ nullable ]
]

{ #category : #comparing }
TypClassType >> hash [
	^ super hash bitXor: self clazz hash
]

{ #category : #printing }
TypClassType >> printOn: aStream [
	clazz printOn: aStream
]

{ #category : #'as yet unclassified' }
TypClassType >> superType [
	^ clazz superclass
		ifNil: [ nullable
				ifTrue: [ TypNilType instance ]
				ifFalse: [ TypNoSuperTypeError signal ] ]
		ifNotNil: #typAsType
]
