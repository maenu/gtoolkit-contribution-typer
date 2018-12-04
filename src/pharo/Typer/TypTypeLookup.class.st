Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypTypeLookup >> clazz [
	^ clazz
]

{ #category : #accessing }
TypTypeLookup >> clazz: anObject [
	clazz := anObject
]

{ #category : #copying }
TypTypeLookup >> copyWithSuperType [
	self assert: [ self hasSuperType ].
	^ self copy
		clazz: clazz superclass;
		yourself
]

{ #category : #testing }
TypTypeLookup >> hasSuperType [
	^ clazz superclass isNotNil
]

{ #category : #initialization }
TypTypeLookup >> initialize [
	<typTypeVariable: 'clazz' as: 'ClassDescription'>
	super initialize
]
