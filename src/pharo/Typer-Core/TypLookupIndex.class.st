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
	instance ifNotNil: #reset.
	instance := nil
]

{ #category : #initialization }
TypLookupIndex class >> resetAll [
	<script>
	self withAllSubclassesDo: #reset
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
TypLookupIndex >> initializeResolver: anObject [
	<typTypeArgument: 1 as: 'TypLookupResolver'>
	resolver := anObject
]

{ #category : #accessing }
TypLookupIndex >> reduce: aCollection [
	aCollection sort.
	aCollection
		ifEmpty: [ ^ TypUnknownType new
				addOrigin: (TypLookupIndexOrigin alternatives: #());
				yourself ].
	^ aCollection first
		addOrigin: (TypLookupIndexOrigin alternatives: aCollection copyWithoutFirst);
		yourself
]

{ #category : #initialization }
TypLookupIndex >> reset [
	resolver reset
]
