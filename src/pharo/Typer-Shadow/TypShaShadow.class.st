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

{ #category : #accessing }
TypShaShadow class >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypNamedType'>
	^ aClass typAsNamedType
]

{ #category : #'class initialization' }
TypShaShadow class >> initialize [
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	self flag: 'FIXME should call new for proper initialize, but seems to break'.
	^ instance ifNil: [ instance := self basicNew ]
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
TypShaShadow class >> resolveMethod: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesMethod: aLookup selector ])
		flatCollect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> resolveVariable: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ])
		flatCollect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #converting }
TypShaShadow >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypType'>
	^ aClass typAsNamedType
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

{ #category : #'as yet unclassified' }
TypShaShadow >> resolveMethod: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesMethod: aLookup selector ])
		flatCollect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaShadow >> resolveVariable: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ])
		flatCollect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	^ self class shadowedClass instanceSide
]
