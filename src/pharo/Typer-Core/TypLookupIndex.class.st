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
	<typPraResult: 'TypLookupIndex'>
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
	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement , MethodAnnouncement
		send: #reset
		to: self
]

{ #category : #accessing }
TypLookupIndex >> initializeResolver: anObject [
	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject
]

{ #category : #initialization }
TypLookupIndex >> reset [
	resolver reset
]
