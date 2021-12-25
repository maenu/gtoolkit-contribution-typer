Class {
	#name : #TypBreadthFirstResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'instance creation' }
TypBreadthFirstResolver class >> resolvers: aCollection [
	^ self new
		initializeResolvers: aCollection;
		yourself
]

{ #category : #resolving }
TypBreadthFirstResolver >> canResolve: aLookup [
	^ resolvers anySatisfy: [ :e | e canResolve: aLookup ]
]

{ #category : #initialization }
TypBreadthFirstResolver >> initialize [
	<typPraVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #initialization }
TypBreadthFirstResolver >> initializeResolvers: anObject [
	<typPraArguments: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidate [
	super invalidate.
	resolvers do: #invalidate
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidateOnClassChange: aClassAnnouncement [

	super invalidateOnClassChange: aClassAnnouncement.
	resolvers do: [ :e | e invalidateOnClassChange: aClassAnnouncement ]
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	super invalidateOnMethodChange: aMethodAnnouncement.
	resolvers do: [ :e | e invalidateOnMethodChange: aMethodAnnouncement ]
]

{ #category : #resolving }
TypBreadthFirstResolver >> resolve: aLookup [

	<typEdge>
	| resolver |
	self assert: [ self canResolve: aLookup ].
	resolver := resolvers detect: [ :e | e canResolve: aLookup ].
	^ resolver resolve: aLookup
]
