Class {
	#name : #TypBreadthLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypBreadthLookupResolver >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #initialization }
TypBreadthLookupResolver >> reset [
	resolvers do: #reset
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolve: aLookup [
	^ resolvers flatCollect: [ :e | e resolve: aLookup ]
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers: anObject [
	resolvers := anObject asOrderedCollection
]
