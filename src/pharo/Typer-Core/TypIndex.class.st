Class {
	#name : #TypIndex,
	#superclass : #Object,
	#instVars : [
		'resolver',
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
TypIndex >> cache [
	^ cache
]

{ #category : #accessing }
TypIndex >> canResolve: aLookup [
	^ (cache includesKey: aLookup)
		ifTrue: [ true ]
		ifFalse: [ resolver canResolve: aLookup ]
]

{ #category : #accessing }
TypIndex >> index [
	^ cache
]

{ #category : #initialization }
TypIndex >> initialize [
	<typPraVariable: 'resolver' as: 'TypResolver'>
	super initialize.
	cache := IdentityDictionary new.
	SystemAnnouncer uniqueInstance
		when: ClassAnnouncement
			send: #invalidateOnClassChangeAsync:
			to: self;
		when: MethodAnnouncement
			send: #invalidateOnMethodChangeAsync:
			to: self
]

{ #category : #invalidation }
TypIndex >> invalidate [
	SystemAnnouncer uniqueInstance unsubscribe: self.
	resolver ifNotNil: #invalidate.
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

{ #category : #accessing }
TypIndex >> invalidateOnClassChangeAsync: aClassAnnouncement [
	[ self invalidateOnClassChange: aClassAnnouncement ] asAsyncFuture typAwait
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

{ #category : #accessing }
TypIndex >> invalidateOnMethodChangeAsync: aMethodAnnouncement [
	[ self invalidateOnMethodChange: aMethodAnnouncement ] asAsyncFuture typAwait
]

{ #category : #accessing }
TypIndex >> preResolve: aLookup [
	^ resolver preResolve: aLookup
]

{ #category : #accessing }
TypIndex >> resolve: aLookup [
	^ cache
		at: aLookup
		ifPresent: [ :t | 
			| resolved type |
			resolved := aLookup resolved.
			resolved result
				ifNil: [ self flag: 'Q how can this happen?'.
					resolved result: t ].
			type := resolved resolver update: resolved.
			self assert: [ type isNotNil ].
			aLookup result: type.
			cache at: aLookup put: type ]
		ifAbsent: [ (resolver canResolve: aLookup)
				ifTrue: [ | type |
					cache at: aLookup put: TypUnknownType instance.
					type := resolver resolve: aLookup.
					self assert: [ type isNotNil ].
					cache at: aLookup put: type ]
				ifFalse: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypIndex >> resolver [
	^ resolver
]
