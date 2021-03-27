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
	| type |
	aCollection ifEmpty: [ ^ self unknown ].
	type := aCollection first.
	type origins
		detect: [ :e | e isKindOf: TypLookupAlternativeOrigin ]
		ifNone: [ type
				addOrigin:
					(TypLookupAlternativeOrigin alternatives: aCollection copyWithoutFirst) ].
	^ type
]

{ #category : #initialization }
TypLookupIndex >> reset [
	resolver reset
]

{ #category : #accessing }
TypLookupIndex >> unknown [
	^ TypUnknownType new
		addOrigin: (TypDescriptionOrigin description: 'no type found');
		yourself
]
