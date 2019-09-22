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
	#category : #'Typer-Shadow'
}

{ #category : #converting }
TypShaShadow class >> asClassLookupResult [
	^ TypClassLookupResult new
		type: [ :a | self asType: a clazz ];
		yourself
]

{ #category : #converting }
TypShaShadow class >> asMethodLookupResultFor: aSymbol [
	^ self class selectors
		detect: [ :e | e = ('___' , aSymbol) or: [ e = ('~~~' , aSymbol) ] ]
		ifFound: [ :e | self perform: e asSymbol withEnoughArguments: {} ]
		ifNone: [ TypMethodLookupResult new
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
TypShaShadow class >> asVariableLookupResultFor: aSymbol [
	^ self class instVarNames
		detect: [ :e | e = ('___' , aSymbol) ]
		ifFound: [ :e | self instVarNamed: e ]
		ifNone: [ TypVariableLookupResult new
				type: [ TypUnknownType instance ];
				yourself ]
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypShaShadow class >> priority [
	^ priority ifNil: [ priority := 0 ]
]

{ #category : #accessing }
TypShaShadow class >> priority: anObject [
	priority := anObject
]

{ #category : #initialization }
TypShaShadow class >> reset [
	<script>
	instance := nil.
	priority := nil
]

{ #category : #initialization }
TypShaShadow class >> resetAll [
	<script>
	self allSubclassesDo: #reset
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #converting }
TypShaShadow >> asClassLookupResult [
	^ TypClassLookupResult new
		type: [ :a | self asType: a clazz ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaShadow >> asMethodLookupResultFor: aSymbol [
	^ self class selectors
		detect: [ :e | e = ('___' , aSymbol) or: [ e = ('~~~' , aSymbol) ] ]
		ifFound: [ :e | self perform: e asSymbol withEnoughArguments: {} ]
		ifNone: [ nil ]
]

{ #category : #converting }
TypShaShadow >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypType'>
	^ aClass typAsNamedType
]

{ #category : #'as yet unclassified' }
TypShaShadow >> asVariableLookupResultFor: aSymbol [
	^ aSymbol first isUppercase
		ifTrue: [ self class classVarNames
				detect: [ :e | e = ('___' , aSymbol) ]
				ifFound: [ :e | self class instanceSide classVarNamed: e ]
				ifNone: [ nil ] ]
		ifFalse: [ self class instVarNames
				detect: [ :e | e = ('___' , aSymbol) ]
				ifFound: [ :e | self instVarNamed: e ]
				ifNone: [ nil ] ]
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
