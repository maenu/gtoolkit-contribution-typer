Class {
	#name : #TypClassType,
	#superclass : #TypType,
	#instVars : [
		'clazz',
		'nullable'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypClassType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ clazz = anObject clazz ] ]
]

{ #category : #accessing }
TypClassType >> clazz [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz: anObject [
	clazz := anObject
]

{ #category : #'as yet unclassified' }
TypClassType >> hasSuperType [
	^ clazz superclass isNotNil or: [ nullable ]
]

{ #category : #comparing }
TypClassType >> hash [
	^ self clazz hash
]

{ #category : #initialization }
TypClassType >> initialize [
	super initialize.
	nullable := true
]

{ #category : #'as yet unclassified' }
TypClassType >> lookupMethodSelector: aSymbol [
	^ (clazz lookupSelector: aSymbol) ifNil: [ TypNoMethodFoundError signal ]
]

{ #category : #accessing }
TypClassType >> nullable [
	^ nullable
]

{ #category : #accessing }
TypClassType >> nullable: anObject [
	nullable := anObject
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
