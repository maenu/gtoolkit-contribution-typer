Class {
	#name : #TypBreadthLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypBreadthLookupResolver class >> resolvers: aCollection [
	^ self new
		initializeResolvers: aCollection;
		yourself
]

{ #category : #initialization }
TypBreadthLookupResolver >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypLookupResolver>'>
	super initialize
]

{ #category : #accessing }
TypBreadthLookupResolver >> initializeResolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypLookupResolver>'>
	resolvers := anObject
]

{ #category : #initialization }
TypBreadthLookupResolver >> reset [
	super reset.
	resolvers do: #reset
]

{ #category : #accessing }
TypBreadthLookupResolver >> resolve: aLookup [
	^ self reduce: (resolvers collect: [ :e | e resolve: aLookup copy ])
]
