Class {
	#name : #TypIndex,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypIndex class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypIndex class >> invalidate [
	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypIndex class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #accessing }
TypIndex >> cache [
	^ cache
]

{ #category : #accessing }
TypIndex >> initialize [
	super initialize.
	cache := IdentityDictionary new
]

{ #category : #accessing }
TypIndex >> invalidate [
	cache removeAll
]

{ #category : #invalidation }
TypIndex >> invalidateOnClassChange: aClassAnnouncement [
	| changed toRemove |
	changed := false.
	toRemove := OrderedCollection new.
	cache
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnClassChange: aClassAnnouncement)
				or: (t invalidateOnClassChange: aClassAnnouncement))
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | cache removeKey: l ].
	toRemove removeAll.
	^ changed or: (resolver invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #invalidation }
TypIndex >> invalidateOnMethodChange: aMethodAnnouncement [
	| changed toRemove |
	changed := false.
	toRemove := OrderedCollection new.
	cache
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnMethodChange: aMethodAnnouncement)
				or: (t invalidateOnMethodChange: aMethodAnnouncement))
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | cache removeKey: l ].
	toRemove removeAll.
	^ changed or: (resolver invalidateOnMethodChange: aMethodAnnouncement)
]
