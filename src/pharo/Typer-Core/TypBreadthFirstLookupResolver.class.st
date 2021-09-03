Class {
	#name : #TypBreadthFirstLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'instance creation' }
TypBreadthFirstLookupResolver class >> resolvers: aCollection [
	^ self new
		initializeResolvers: aCollection;
		yourself
]

{ #category : #resolving }
TypBreadthFirstLookupResolver >> canResolve: aLookup [
	^ resolvers anySatisfy: [ :e | e canResolve: aLookup ]
]

{ #category : #initialization }
TypBreadthFirstLookupResolver >> initialize [
	<typPraVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #initialization }
TypBreadthFirstLookupResolver >> initializeResolvers: anObject [
	<typPraArguments: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject
]

{ #category : #invalidation }
TypBreadthFirstLookupResolver >> invalidateOn: aClassOrMethodAnnouncement [

	super invalidateOn: aClassOrMethodAnnouncement.
	resolvers do: [ :e | e invalidateOn: aClassOrMethodAnnouncement ]
]

{ #category : #resetting }
TypBreadthFirstLookupResolver >> reset [
	super reset.
	resolvers do: #reset
]

{ #category : #resolving }
TypBreadthFirstLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (resolvers detect: [ :e | e canResolve: aLookup ]) resolve: aLookup
]
