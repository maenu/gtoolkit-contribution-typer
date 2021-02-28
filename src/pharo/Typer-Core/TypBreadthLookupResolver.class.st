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
	super reset.
	resolvers do: #reset
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolveBasic: aLookup [
	^ resolvers flatCollect: [ :e | e resolve: aLookup copy ]
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject
]
