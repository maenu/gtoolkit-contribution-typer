Class {
	#name : #TypIndex,
	#superclass : #TypNode,
	#instVars : [
		'resolver',
		'canResolve',
		'preResolve'
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

{ #category : #accessing }
TypIndex >> canResolve: aLookup [
	^ canResolve at: aLookup ifAbsentPut: [ resolver canResolve: aLookup ]
]

{ #category : #initialization }
TypIndex >> initialize [
	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize.
	canResolve := Dictionary new.
	preResolve := Dictionary new.
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

	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject.
	self outAt: #resolver put: resolver
]

{ #category : #invalidation }
TypIndex >> invalidate [
	resolver invalidate.
	canResolve removeAll.
	preResolve removeAll.
	super invalidate
]

{ #category : #invalidation }
TypIndex >> invalidateOnClassChange: aClassAnnouncement [

	| changed |
	changed := false.
	(out flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypLookup ]
		thenDo: [ :e | 
			((e key invalidateOnClassChange: aClassAnnouncement) or:
				 (e target invalidateOnClassChange: aClassAnnouncement)) ifTrue: [ 
				self outRemove: e.
				changed := true ] ].
	^ changed or: (resolver invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #invalidation }
TypIndex >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	(out flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypLookup ]
		thenDo: [ :e | 
			((e key invalidateOnMethodChange: aMethodAnnouncement) or:
				 (e target invalidateOnMethodChange: aMethodAnnouncement)) 
				ifTrue: [ 
					self outRemove: e.
					changed := true ] ].
	^ changed or:
		  (resolver invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #accessing }
TypIndex >> preResolve: aLookup [
	^ preResolve at: aLookup ifAbsentPut: [ resolver preResolve: aLookup ]
]

{ #category : #accessing }
TypIndex >> resolve: aLookup [

	^ self outAt: aLookup ifAbsent: [ 
		  (resolver canResolve: aLookup)
			  ifTrue: [ 
				  self outAt: aLookup put: TypUnknownType instance.
				  self outAt: aLookup put: (resolver resolve: aLookup) ]
			  ifFalse: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypIndex >> resolvedLookup: aLookup [
	self assert: [ self canResolve: aLookup ].
	self resolve: aLookup.
	^ (out keys detect: [ :e | e = aLookup ]) resolved
]
