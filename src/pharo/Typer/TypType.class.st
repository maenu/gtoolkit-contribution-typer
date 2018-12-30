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
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType >= self
]

{ #category : #comparing }
TypType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypType".
					self nullable = object nullable ] ]
]

{ #category : #comparing }
TypType >> > aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	(aType isNil or: aType isUnknown)
		ifTrue: [ ^ aType > self ].
	^ self isSuperTypeOf: aType
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
		ifTrue: [ self superType allSuperTypes
				addFirst: self superType;
				yourself ]
		ifFalse: [ OrderedCollection new "typParameters TypType" ]
]

{ #category : #converting }
TypType >> asClass [
	<typTypeResultAs: 'ClassDescription'>
	TypNoClassError signal
]

{ #category : #converting }
TypType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeArgument: 3 as: 'Boolean'>
	<typTypeResultAs: 'TypFunctionType'>
	TypNoTypeError signal
]

{ #category : #converting }
TypType >> asNamedType [
	<typTypeResultAs: 'TypNamedType'>
	TypNoTypeError signal
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
	TypNoTypeError signal
]

{ #category : #accessing }
TypType >> asTypeCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	| superTypes |
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	superTypes := self withAllSuperTypes.
	^ aType withAllSuperTypes detect: [ :e | superTypes anySatisfy: [ :f | e >= f ] ] ifNone: [ TypUnknownType instance ]
]

{ #category : #testing }
TypType >> hasClass [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	^ false
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

{ #category : #testing }
TypType >> isFunction [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
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
	nullable
		ifTrue: [ aStream << '!' ]
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	TypNoTypeError signal
]

{ #category : #accessing }
TypType >> withAllSuperTypes [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	| superTypes |
	superTypes := self allSuperTypes.
	superTypes addFirst: self.
	^ superTypes
]
