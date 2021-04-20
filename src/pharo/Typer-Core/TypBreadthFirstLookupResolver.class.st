Class {
	#name : #TypBreadthFirstLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypBreadthFirstLookupResolver class >> resolvers: aCollection [
	^ self new
		initializeResolvers: aCollection;
		yourself
]

{ #category : #accessing }
TypBreadthFirstLookupResolver >> canResolve: aLookup [
	^ resolvers anySatisfy: [ :e | e canResolve: aLookup ]
]

{ #category : #initialization }
TypBreadthFirstLookupResolver >> initialize [
	<typPraVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #accessing }
TypBreadthFirstLookupResolver >> initializeResolvers: anObject [
	<typPraArguments: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject
]

{ #category : #initialization }
TypBreadthFirstLookupResolver >> reset [
	super reset.
	resolvers do: #reset
]

{ #category : #accessing }
TypBreadthFirstLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (resolvers detect: [ :e | e canResolve: aLookup ]) resolve: aLookup
]
