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
	anObject = resolvers ifTrue: [ ^ self ].
	resolvers := anObject
]

{ #category : #accessing }
TypBreadthFirstResolver >> printOn: aStream [

	aStream nextPutAll: '→{'.
	resolvers withIndexDo: [ :e :i | 
		e printOn: aStream.
		i < resolvers size ifTrue: [ aStream nextPut: $, ] ].
	aStream nextPut: $}
]

{ #category : #resolving }
TypBreadthFirstResolver >> resolve: aLookup [
	^ (resolvers detect: [ :e | e canResolve: aLookup ]) resolve: aLookup
]
