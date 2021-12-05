Class {
	#name : #TypShaShadow,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaShadow class >> canResolveMethod: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #accessing }
TypShaShadow class >> canResolveType: aLookup [
	^ self class includesSelector: #resolveType:
]

{ #category : #accessing }
TypShaShadow class >> canResolveVariable: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesVariable: aLookup selector ]
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new initialize ]
]

{ #category : #initialization }
TypShaShadow class >> invalidate [
	<script>
	instance := nil
]

{ #category : #initialization }
TypShaShadow class >> invalidateAll [
	<script>
	self allSubclassesDo: #invalidate
]

{ #category : #accessing }
TypShaShadow class >> resolveType: aLookup [
	^ aLookup root classDescription typAsNamedType
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typPraResult: 'MetaClass'>
	self subclassResponsibility
]

{ #category : #accessing }
TypShaShadow >> canResolveMethod: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #accessing }
TypShaShadow >> canResolveType: aLookup [
	^ self class includesSelector: #resolveType:
]

{ #category : #accessing }
TypShaShadow >> canResolveVariable: aLookup [
	^ self class methods
		anySatisfy: [ :e | e typShaResolvesVariable: aLookup selector ]
]

{ #category : #converting }
TypShaShadow >> resolveType: aLookup [
	^ aLookup root classDescription typAsNamedType
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typPraResult: 'Class'>
	^ self class shadowedClass instanceSide
]
