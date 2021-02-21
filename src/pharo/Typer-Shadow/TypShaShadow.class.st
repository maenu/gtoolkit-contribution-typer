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
		collect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #accessing }
TypShaShadow class >> resolveType: aLookup [
	^ aLookup classDescription typAsNamedType
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> resolveVariable: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ])
		collect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'MetaClass'>
	self subclassResponsibility
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
		collect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #converting }
TypShaShadow >> resolveType: aLookup [
	^ aLookup classDescription typAsNamedType
]

{ #category : #'as yet unclassified' }
TypShaShadow >> resolveVariable: aLookup [
	^ (self class methods
		select: [ :e | e typShaResolvesVariable: aLookup selector ])
		collect: [ :e | self perform: e selector with: aLookup ]
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'Class'>
	^ self class shadowedClass instanceSide
]
