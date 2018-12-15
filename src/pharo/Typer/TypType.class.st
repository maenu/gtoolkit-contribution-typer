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
	^ aType isCompatibleWith: self
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self < aType ]
]

{ #category : #comparing }
TypType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ nullable = anObject nullable ] ]
]

{ #category : #comparing }
TypType >> > aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self isCompatibleWith: aType
]

{ #category : #comparing }
TypType >> >= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self > aType ]
]

{ #category : #accessing }
TypType >> allSuperTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
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
TypType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeArgument: 3 as: 'Boolean'>
	<typTypeResultAs: 'TypFunctionType'>
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
TypType >> asNullableType [
	<typTypeResultAs: 'TypType'>
	^ nullable
		ifTrue: [ self ]
		ifFalse: [ self copy
				nullable: true;
				yourself ]
]

{ #category : #converting }
TypType >> asParametricType: someTypes [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeResultAs: 'TypParametricType'>
	self subclassResponsibility
]

{ #category : #accessing }
TypType >> asSourceString [
	<typTypeResultAs: 'String<Character>'>
	^ nullable
		ifTrue: [ '!' ]
		ifFalse: [ '' ]
]

{ #category : #converting }
TypType >> canBeFunctionType [
	<typTypeResultAs: 'Boolean'>
	^ false
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
	^ nullable hash
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'nullable' as: 'Boolean'>
	super initialize.
	nullable := false
]

{ #category : #comparing }
TypType >> isCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self isSuperTypeOf: aType
]

{ #category : #testing }
TypType >> isFunction [
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
TypType >> isSuperTypeOf: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType allSuperTypes includes: self
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
		ifTrue: [ aStream << '!' ]
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	self subclassResponsibility
]

{ #category : #accessing }
TypType >> withAllSuperTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	| superTypes |
	superTypes := self allSuperTypes.
	superTypes addFirst: self.
	^ superTypes
]
