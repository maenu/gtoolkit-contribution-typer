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
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self isSubTypeOf: aType
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self < aType ]
]

{ #category : #comparing }
TypType >> = anObject [
	<typTypeArgument: 1 as: 'Object'>
	<typTypeResultAs: 'Boolean'>
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable ] ]
]

{ #category : #comparing }
TypType >> > aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType isSubTypeOf: self
]

{ #category : #comparing }
TypType >> >= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self > aType ]
]

{ #category : #accessing }
TypType >> allSuperTypes [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ self hasSuperType
		ifTrue: [ | temp |
			temp := self superType allSuperTypes.
			temp addFirst: self superType.
			temp ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #converting }
TypType >> asClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #converting }
TypType >> asNonNullableType [
	<typTypeResultAs: 'TypType'>
	^ nullable
		ifTrue: [ self copy
				nullable: false;
				yourself ]
		ifFalse: [ self ]
]

{ #category : #converting }
TypType >> asNonParametricType [
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asParametricType: someTypes [
	<typTypeArgument: 1 as: 'OrderedCollection<TypType>'>
	<typTypeResultAs: 'TypParametricType'>
	self subclassResponsibility
]

{ #category : #converting }
TypType >> canBeParametricType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> hasClass [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	^ true
]

{ #category : #comparing }
TypType >> hash [
	<typTypeResultAs: 'Integer'>
	^ nullable hash
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'nullable' as: 'Boolean'>
	super initialize.
	nullable := false
]

{ #category : #testing }
TypType >> isBlockClosure [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isParametric [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #comparing }
TypType >> isSubTypeOf: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self allSuperTypes includes: aType
]

{ #category : #testing }
TypType >> isUnion [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #accessing }
TypType >> nullable [
	<typTypeResultAs: 'Boolean'>
	^ nullable
]

{ #category : #accessing }
TypType >> nullable: anObject [
	<typTypeArgument: 1 as: 'Boolean'>
	nullable := anObject
]

{ #category : #printing }
TypType >> printOn: aStream [
	<typTypeArgument: 1 as: 'Stream'>
	nullable
		ifTrue: [ aStream << '! ' ]
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	self subclassResponsibility
]

{ #category : #accessing }
TypType >> withAllSuperTypes [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	| superTypes |
	superTypes := self allSuperTypes.
	superTypes addFirst: self.
	^ superTypes
]
