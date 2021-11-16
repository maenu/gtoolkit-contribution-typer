Class {
	#name : #TypBreadthFirstResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : 'Typer-Core-Lookup'
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
TypBreadthFirstResolver >> invalidateOn: aClassOrMethodAnnouncement [

	super invalidateOn: aClassOrMethodAnnouncement.
	resolvers do: [ :e | e invalidateOn: aClassOrMethodAnnouncement ]
]

{ #category : #resetting }
TypBreadthFirstResolver >> reset [
	super reset.
	resolvers do: #reset
]

{ #category : #resolving }
TypBreadthFirstResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (resolvers detect: [ :e | e canResolve: aLookup ]) resolve: aLookup
]
