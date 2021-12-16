Class {
	#name : #TypIndex,
	#superclass : #TypNode,
	#instVars : [
		'resolver',
		'unknown'
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

{ #category : #invalidation }
TypIndex class >> invalidate [

	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #invalidation }
TypIndex class >> invalidateAll [

	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #initialization }
TypIndex >> initialize [

	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize.
	unknown := TypUnknownType new.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement send: #invalidateOnClassChange: to: self;
		when: MethodAnnouncement send: #invalidateOnMethodChange: to: self
]

{ #category : #initialization }
TypIndex >> initializeResolver: anObject [
	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject
]

{ #category : #invalidation }
TypIndex >> invalidate [
	resolver invalidate
]

{ #category : #invalidation }
TypIndex >> invalidateOnClassChange: aClassAnnouncement [

	resolver invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypIndex >> invalidateOnMethodChange: aMethodAnnouncement [

	resolver invalidateOnMethodChange: aMethodAnnouncement
]
