Class {
	#name : #TypIndex,
	#superclass : #TypNode,
	#instVars : [
		'resolver'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypIndex class >> instance [
	<typPraResult: 'TypLookupIndex'>
	self subclassResponsibility
]

{ #category : #resetting }
TypIndex class >> reset [
	<script>
	instance ifNotNil: #reset.
	instance := nil
]

{ #category : #resetting }
TypIndex class >> resetAll [
	<script>
	self withAllSubclassesDo: #reset
]

{ #category : #initialization }
TypIndex >> initialize [

	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement , MethodAnnouncement
		send: #invalidateOn:
		to: self
]

{ #category : #initialization }
TypIndex >> initializeResolver: anObject [
	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject
]

{ #category : #resetting }
TypIndex >> invalidateOn: aClassOrMethodAnnouncement [

	resolver invalidateOn: aClassOrMethodAnnouncement
]

{ #category : #resetting }
TypIndex >> reset [
	resolver reset
]
