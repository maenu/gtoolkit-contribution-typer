Class {
	#name : #TypIndex,
	#superclass : #Object,
	#instVars : [
		'resolver',
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
	^ (resolve includesKey: aLookup)
		ifTrue: [ true ]
		ifFalse: [ resolver canResolve: aLookup ]
]

{ #category : #accessing }
TypIndex >> index [
	^ resolve
]

{ #category : #initialization }
TypIndex >> initialize [
	<typPraVariable: 'resolver' as: 'TypResolver'>
	super initialize.
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
	resolve removeAll
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
	^ changed or: (resolver invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #accessing }
TypIndex >> preResolve: aLookup [
	^ resolver preResolve: aLookup
]

{ #category : #accessing }
TypIndex >> resolve: aLookup [
	^ resolve
		at: aLookup
		ifPresent: [ :t | 
			| resolved type |
			resolved := aLookup resolved.
			resolved result
				ifNil: [ self flag: 'TODO how can this happen'.
					resolved result: t ].
			type := resolved resolver update: resolved.
			self assert: [ type isNotNil ].
			resolve at: aLookup put: type ]
		ifAbsent: [ (resolver canResolve: aLookup)
				ifTrue: [ | type |
					type := resolver resolve: aLookup.
					self assert: [ type isNotNil ].
					resolve at: aLookup put: type ]
				ifFalse: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypIndex >> resolver [
	^ resolver
]
