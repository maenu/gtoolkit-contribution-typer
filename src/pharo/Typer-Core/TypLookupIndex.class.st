Class {
	#name : #TypLookupIndex,
	#superclass : #Object,
	#instVars : [
		'resolver'
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
	self instance reset.
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
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement , MethodAnnouncement
		send: #reset
		to: self
]

{ #category : #accessing }
TypLookupIndex >> lookup: aLookup [
	| types type rest |
	self flag: 'FIXME unknown, really?'.
	types := resolver resolve: aLookup.
	types ifEmpty: [ ^ TypUnknownType new ].
	type := types first.
	rest := types allButFirst.
	type origin add: (TypLookupIndexOrigin alternatives: rest).
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
