Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypTypeLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypTypeLookup".
					clazz = object clazz ] ]
]

{ #category : #copying }
TypTypeLookup >> adaptWithSuperType [
	self assert: [ self hasSuperType ].
	self clazz: clazz superclass
]

{ #category : #accessing }
TypTypeLookup >> clazz [
	<typTypeResultAs: 'ClassDescription'>
	^ clazz
]

{ #category : #accessing }
TypTypeLookup >> clazz: anObject [
	<typTypeArgument: 1 as: 'ClassDescription'>
	clazz := anObject
]

{ #category : #testing }
TypTypeLookup >> hasSuperType [
	^ clazz superclass isNotNil and: [ clazz superclass ~= clazz and: [ (clazz superclass inheritsFrom: clazz) not ] ]
]

{ #category : #comparing }
TypTypeLookup >> hash [
	^ clazz hash
]

{ #category : #initialization }
TypTypeLookup >> initialize [
	<typTypeVariable: 'clazz' as: 'ClassDescription'>
	super initialize
]
