Class {
	#name : #TypClassLookup,
	#superclass : #TypLookup,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core-Typer-Core'
}

{ #category : #comparing }
TypClassLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypClassLookup".
					clazz = object clazz ] ]
]

{ #category : #copying }
TypClassLookup >> adaptWithSuperType [
	self assert: [ self hasSuperType ].
	self clazz: clazz superclass
]

{ #category : #accessing }
TypClassLookup >> clazz [
	<typTypeResultAs: 'ClassDescription'>
	^ clazz
]

{ #category : #accessing }
TypClassLookup >> clazz: anObject [
	<typTypeArgument: 1 as: 'ClassDescription'>
	clazz := anObject
]

{ #category : #testing }
TypClassLookup >> hasSuperType [
	^ clazz superclass isNotNil and: [ clazz superclass ~= clazz and: [ (clazz superclass inheritsFrom: clazz) not ] ]
]

{ #category : #comparing }
TypClassLookup >> hash [
	^ clazz hash
]

{ #category : #initialization }
TypClassLookup >> initialize [
	<typTypeVariable: 'clazz' as: 'ClassDescription'>
	super initialize
]
