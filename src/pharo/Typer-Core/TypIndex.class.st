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
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement send: #invalidateOnClassChange: to: self;
		when: MethodAnnouncement send: #invalidateOnMethodChange: to: self
]

{ #category : #initialization }
TypIndex >> initializeResolver: anObject [

	<typPraArguments: 'TypLookupResolver'>
	resolver := anObject.
	self outgoingAt: #resolver put: resolver
]

{ #category : #invalidation }
TypIndex >> invalidate [

	resolver invalidate.
	super invalidate
]

{ #category : #invalidation }
TypIndex >> invalidateOnClassChange: aClassAnnouncement [

	resolver invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypIndex >> invalidateOnMethodChange: aMethodAnnouncement [

	resolver invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #accessing }
TypIndex >> resolve: aLookup [

	^ self outgoingAt: aLookup ifAbsent: [ 
		  (resolver canResolve: aLookup)
			  ifTrue: [ 
				  self outgoingAt: aLookup put: TypUnknownType instance.
				  self outgoingAt: aLookup put: (resolver resolve: aLookup) ]
			  ifFalse: [ TypUnknownType instance ] ]
]
