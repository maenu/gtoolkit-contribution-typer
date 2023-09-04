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
	resolvers ifNotNil: [ self outRemoveAt: #resolvers ].
	resolvers := anObject.
	resolvers ifNotNil: [ 
		resolvers do: [ :e | self outAddTarget: e key: #resolvers ] ]
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidate [

	resolvers do: #invalidate.
	super invalidate
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidateOnClassChange: aClassAnnouncement [

	| changed |
	changed := false.
	resolvers do: [ :e | 
		changed := changed or:
			           (e invalidateOnClassChange: aClassAnnouncement) ].
	^ changed
]

{ #category : #invalidation }
TypBreadthFirstResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	resolvers do: [ :e | 
		changed := changed or:
			           (e invalidateOnMethodChange: aMethodAnnouncement) ].
	^ changed
]

{ #category : #accessing }
TypBreadthFirstResolver >> preResolve: aLookup [
	resolvers do: [ :r | (r preResolve: aLookup) ifNotNil: [ :e | ^ e ] ].
	^ nil
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
	self assert: [ self canResolve: aLookup ].
	^ (resolvers detect: [ :e | e canResolve: aLookup ]) resolve: aLookup
]
