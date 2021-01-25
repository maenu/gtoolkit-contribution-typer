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
					object := anObject "typCastAs TypClassDescriptionLookup".
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

{ #category : #'as yet unclassified' }
TypClassDescriptionLookup >> emptyResult [
	^ TypClassDescriptionLookupResult new
		originalLookup: self;
		resolvedLookup: self;
		yourself
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
	<typTypeVariable: 'classDescription' as: 'ClassDescription'>
	super initialize
]

{ #category : #accessing }
TypClassDescriptionLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name
]
