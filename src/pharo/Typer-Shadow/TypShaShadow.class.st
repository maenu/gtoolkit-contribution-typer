Class {
	#name : #TypShaShadow,
	#superclass : #Object,
	#instVars : [
		'priority'
	],
	#classInstVars : [
		'priority',
		'instance'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #converting }
TypShaShadow class >> asMethodResolverFor: aSymbol [
	^ self class selectors
		detect: [ :e | e = ('___' , aSymbol) or: [ e = ('~~~' , aSymbol) ] ]
		ifFound: [ :e | self perform: e asSymbol withEnoughArguments: {} ]
		ifNone: [ TypMethodResolver new
				argumentTypes: [ TypUnknownType instance ];
				resultType: [ TypUnknownType instance ];
				signalsAlways: [ nil ];
				yourself ]
]

{ #category : #accessing }
TypShaShadow class >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypNamedType'>
	^ aClass typAsNamedType
]

{ #category : #converting }
TypShaShadow class >> asTypeResolver [
	^ TypTypeResolver new
		type: [ :a | self asType: a clazz ];
		yourself
]

{ #category : #converting }
TypShaShadow class >> asVariableResolverFor: aSymbol [
	^ self class instVarNames
		detect: [ :e | e = ('___' , aSymbol) ]
		ifFound: [ :e | self instVarNamed: e ]
		ifNone: [ TypVariableResolver new
				type: [ TypUnknownType instance ];
				yourself ]
]

{ #category : #'class initialization' }
TypShaShadow class >> initialize [
	super initialize.
	priority := 0
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypShaShadow class >> priority [
	^ priority
]

{ #category : #accessing }
TypShaShadow class >> priority: anObject [
	priority := anObject
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypShaShadow >> asMethodResolverFor: aSymbol [
	^ self class selectors
		detect: [ :e | e = ('___' , aSymbol) or: [ e = ('~~~' , aSymbol) ] ]
		ifFound: [ :e | self perform: e asSymbol withEnoughArguments: {} ]
		ifNone: [ TypMethodResolver new ]
]

{ #category : #converting }
TypShaShadow >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypType'>
	^ aClass typAsNamedType
]

{ #category : #converting }
TypShaShadow >> asTypeResolver [
	^ TypTypeResolver new
		type: [ :a | self asType: a clazz ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaShadow >> asVariableResolverFor: aSymbol [
	^ aSymbol first isUppercase
		ifTrue: [ self class classVarNames
				detect: [ :e | e = ('___' , aSymbol) ]
				ifFound: [ :e | self class instanceSide classVarNamed: e ]
				ifNone: [ TypVariableResolver new ] ]
		ifFalse: [ self class instVarNames
				detect: [ :e | e = ('___' , aSymbol) ]
				ifFound: [ :e | self instVarNamed: e ]
				ifNone: [ TypVariableResolver new ] ]
]

{ #category : #initialization }
TypShaShadow >> initialize [
	super initialize.
	priority := 0
]

{ #category : #accessing }
TypShaShadow >> priority [
	^ priority
]

{ #category : #accessing }
TypShaShadow >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	^ self class shadowedClass instanceSide
]
