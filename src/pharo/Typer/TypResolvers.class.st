Class {
	#name : #TypResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers',
		'defaultResolver'
	],
	#classInstVars : [
		'global'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypResolvers class >> global [
	^ global ifNil: [ self initializeGlobal ]
]

{ #category : #accessing }
TypResolvers class >> initializeGlobal [
	^ global := self new
]

{ #category : #accessing }
TypResolvers >> defaultResolver [
	<typTypeResultAs: 'TypResolver<TypLookup>'>
	^ defaultResolver
]

{ #category : #accessing }
TypResolvers >> defaultResolver: anObject [
	<typTypeArgument: 1 as: 'TypResolver<TypLookup>'>
	defaultResolver := anObject
]

{ #category : #initialization }
TypResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypLookup>'>
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #accessing }
TypResolvers >> resolvers [
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypResolvers >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	resolvers := anObject
]

{ #category : #'as yet unclassified' }
TypResolvers >> resolversFor: aLookup [
	^ (resolvers select: [ :e | e resolves: aLookup ]) flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypResolvers >> resolves: aLookup [
	^ resolvers anySatisfy: [ :e | e resolves: aLookup ]
]

{ #category : #accessing }
TypResolvers >> typeFor: aLookup using: aBlock [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'BlockClosure(TypResolver<TypLookup>,TypLookup)->TypType'>
	<typTypeResultAs: 'TypType'>
	| lookup |
	lookup := aLookup.
	[ (self resolversFor: lookup)
		do: [ :e | 
			| type |
			type := aBlock cull: e cull: lookup.
			type isUnknown
				ifFalse: [ ^ type ] ].
	lookup hasSuperType
		ifTrue: [ lookup := lookup copyWithSuperType ] ] doWhileTrue: [ lookup hasSuperType ].
	(defaultResolver isNotNil and: [ defaultResolver resolves: aLookup ])
		ifTrue: [ ^ aBlock cull: defaultResolver cull: aLookup ].
	^ TypUnknownType instance
]
