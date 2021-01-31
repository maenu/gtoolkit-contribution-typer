Class {
	#name : #TypCompositeLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypCompositeLookupResolver >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #initialization }
TypCompositeLookupResolver >> reset [
	resolvers do: #reset
]

{ #category : #accessing }
TypCompositeLookupResolver >> resolve: aLookup [
	aLookup push: self.
	^ resolvers flatCollect: [ :e | e resolve: aLookup copy ]
]

{ #category : #accessing }
TypCompositeLookupResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypCompositeLookupResolver >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject asOrderedCollection
]
