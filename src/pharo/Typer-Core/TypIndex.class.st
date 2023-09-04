Class {
	#name : #TypIndex,
	#superclass : #Object,
	#instVars : [
		'resolver',
		'canResolve',
		'preResolve',
		'resolve'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypIndex class >> instance [
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

{ #category : #accessing }
TypIndex >> canResolve: aLookup [
	^ canResolve at: aLookup ifAbsentPut: [ resolver canResolve: aLookup ]
]

{ #category : #initialization }
TypIndex >> initialize [
	<typPraVariable: 'resolver' as: 'TypResolver'>
	super initialize.
	canResolve := IdentityDictionary new.
	preResolve := IdentityDictionary new.
	resolve := IdentityDictionary new.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement
			send: #invalidateOnClassChange:
			to: self;
		when: MethodAnnouncement
			send: #invalidateOnMethodChange:
			to: self
]

{ #category : #initialization }
TypIndex >> initializeResolver: anObject [
	resolver := anObject
]

{ #category : #invalidation }
TypIndex >> invalidate [
	resolver invalidate.
	canResolve removeAll.
	preResolve removeAll.
	resolve removeAll.
]

{ #category : #accessing }
TypIndex >> invalidateIndex: aDictionary onClassChange: aClassAnnouncement [
	| changed |
	changed := OrderedCollection new.
	aDictionary
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnClassChange: aClassAnnouncement)
				or: (t invalidateOnClassChange: aClassAnnouncement))
				ifTrue: [ changed add: l ] ].
	changed do: [ :l | aDictionary removeKey: l ].
	^ changed isNotEmpty
]

{ #category : #accessing }
TypIndex >> invalidateIndex: aDictionary onMethodChange: aMethodAnnouncement [
	| changed |
	changed := OrderedCollection new.
	aDictionary
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnMethodChange: aMethodAnnouncement)
				or: (t invalidateOnMethodChange: aMethodAnnouncement))
				ifTrue: [ changed add: l ] ].
	changed do: [ :l | aDictionary removeKey: l ].
	^ changed isNotEmpty
]

{ #category : #invalidation }
TypIndex >> invalidateOnClassChange: aClassAnnouncement [
	| changed toRemove |
	changed := false.
	toRemove := OrderedCollection new.
	resolve
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnClassChange: aClassAnnouncement)
				or: (t invalidateOnClassChange: aClassAnnouncement))
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | resolve removeKey: l ].
	toRemove removeAll.
	canResolve
		keysDo: [ :l | 
			(l invalidateOnClassChange: aClassAnnouncement)
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | canResolve removeKey: l ].
	toRemove removeAll.
	preResolve
		keysDo: [ :l | 
			(l invalidateOnClassChange: aClassAnnouncement)
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | preResolve removeKey: l ].
	toRemove removeAll.
	^ changed or: (resolver invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #invalidation }
TypIndex >> invalidateOnMethodChange: aMethodAnnouncement [
	| changed toRemove |
	changed := false.
	toRemove := OrderedCollection new.
	resolve
		keysAndValuesDo: [ :l :t | 
			((l invalidateOnMethodChange: aMethodAnnouncement)
				or: (t invalidateOnMethodChange: aMethodAnnouncement))
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | resolve removeKey: l ].
	toRemove removeAll.
	canResolve
		keysDo: [ :l | 
			(l invalidateOnMethodChange: aMethodAnnouncement)
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | canResolve removeKey: l ].
	toRemove removeAll.
	preResolve
		keysDo: [ :l | 
			(l invalidateOnMethodChange: aMethodAnnouncement)
				ifTrue: [ changed := true.
					toRemove add: l ] ].
	toRemove do: [ :l | preResolve removeKey: l ].
	toRemove removeAll.
	^ changed or: (resolver invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #accessing }
TypIndex >> preResolve: aLookup [
	^ preResolve at: aLookup ifAbsentPut: [ resolver preResolve: aLookup ]
]

{ #category : #accessing }
TypIndex >> resolve: aLookup [
	^ resolve
		at: aLookup
		ifAbsent: [ (resolver canResolve: aLookup)
				ifTrue: [ resolve at: aLookup put: (resolver resolve: aLookup) ]
				ifFalse: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypIndex >> resolver [
	^ resolver
]
