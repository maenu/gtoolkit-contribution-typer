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
	^ self subclassResponsibility
]

{ #category : #initialization }
TypLookupIndex class >> reset [
	<script>
	instance := nil
]

{ #category : #initialization }
TypLookupIndex class >> resetAll [
	<script>
	self allSubclassesDo: #reset.
	Smalltalk garbageCollect
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
