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

{ #category : #resetting }
TypLookupIndex class >> reset [
	<script>
	instance ifNotNil: #reset.
	instance := nil
]

{ #category : #resetting }
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
		send: #invalidateOn:
		to: self
]

{ #category : #initialization }
TypLookupIndex >> initializeResolver: anObject [
	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject
]

{ #category : #resetting }
TypLookupIndex >> invalidateOn: aClassOrMethodAnnouncement [

	resolver invalidateOn: aClassOrMethodAnnouncement
]

{ #category : #resetting }
TypLookupIndex >> reset [
	resolver reset
]
