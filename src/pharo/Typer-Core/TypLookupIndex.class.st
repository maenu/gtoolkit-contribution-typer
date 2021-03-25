Class {
	#name : #TypLookupIndex,
	#superclass : #Object,
	#instVars : [
		'resolver',
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupIndex class >> instance [
	<typTypeResultAs: 'TypLookupIndex'>
	self subclassResponsibility
]

{ #category : #initialization }
TypLookupIndex class >> reset [
	<script>
	instance ifNotNil: #reset.
	instance := nil
]

{ #category : #initialization }
TypLookupIndex class >> resetAll [
	<script>
	self allSubclassesDo: #reset
]

{ #category : #initialization }
TypLookupIndex >> initialize [
	<typTypeVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize.
	cache := Dictionary new.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement , MethodAnnouncement
		send: #reset
		to: self
]

{ #category : #accessing }
TypLookupIndex >> lookup: aLookup [
	| types type |
	types := (resolver resolve: aLookup) asSet asOrderedCollection.
	types sort.
	types
		ifEmpty: [ types
				add:
					(TypUnknownType new
						addOrigin: (TypLookupIndexOrigin alternatives: #());
						yourself) ].
	type := types first.
	type addOrigin: (TypLookupIndexOrigin alternatives: types copyWithoutFirst ).
	^ type
]

{ #category : #initialization }
TypLookupIndex >> reset [
	resolver reset
]

{ #category : #accessing }
TypLookupIndex >> resolver [
	^ resolver
]

{ #category : #accessing }
TypLookupIndex >> resolver: anObject [
	<typTypeArgument: 1 as: 'TypLookupResolver'>
	resolver := anObject
]
