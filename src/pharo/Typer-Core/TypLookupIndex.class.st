Class {
	#name : #TypLookupIndex,
	#superclass : #Object,
	#instVars : [
		'resolver'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Typer-Core'
}

{ #category : #accessing }
TypLookupIndex class >> instance [
	^ instance ifNil: [ instance := self newDefault ]
]

{ #category : #accessing }
TypLookupIndex class >> newDefault [
	self subclassResponsibility
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
	resolver := anObject
]
