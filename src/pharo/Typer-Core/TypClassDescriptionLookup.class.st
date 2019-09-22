Class {
	#name : #TypClassDescriptionLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #comparing }
TypClassDescriptionLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypClassLookup".
					classDescription = object classDescription ] ]
]

{ #category : #copying }
TypClassDescriptionLookup >> adaptWithSuperType [
	self assert: [ self hasSuperType ].
	self classDescription: classDescription superclass
]

{ #category : #accessing }
TypClassDescriptionLookup >> classDescription [
	<typTypeResultAs: 'ClassDescription'>
	^ classDescription
]

{ #category : #accessing }
TypClassDescriptionLookup >> classDescription: anObject [
	<typTypeArgument: 1 as: 'ClassDescription'>
	classDescription := anObject
]

{ #category : #testing }
TypClassDescriptionLookup >> hasSuperType [
	^ classDescription superclass isNotNil and: [ classDescription superclass ~= classDescription and: [ (classDescription superclass inheritsFrom: classDescription) not ] ]
]

{ #category : #comparing }
TypClassDescriptionLookup >> hash [
	^ classDescription hash
]

{ #category : #initialization }
TypClassDescriptionLookup >> initialize [
	<typTypeVariable: 'clazz' as: 'ClassDescription'>
	super initialize
]
