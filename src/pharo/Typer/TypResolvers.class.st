Class {
	#name : #TypResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypLookup>>'>
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #accessing }
TypResolvers >> resolvers [
	<typTypeResultAs: 'OrderedCollection<TypResolver<TypLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypResolvers >> resolvers: anObject [
	<typTypeArgument: 1 as: 'OrderedCollection<TypResolver<TypLookup>>'>
	resolvers := anObject
]

{ #category : #'as yet unclassified' }
TypResolvers >> resolversFor: aLookup [
	self assert: [ self resolves: aLookup ].
	^ (resolvers select: [ :e | e resolves: aLookup ]) flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypResolvers >> resolves: aLookup [
	^ resolvers anySatisfy: [ :e | e resolves: aLookup ]
]

{ #category : #accessing }
TypResolvers >> typeFor: aLookup using: aBlock [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'BlockClosure<TypResolver<TypLookup>,TypLookup,TypType>'>
	<typTypeResultAs: 'TypType'>
	| lookup |
	lookup := aLookup.
	[ ((resolvers select: [ :e | e resolves: lookup ]) flatCollect: [ :e | e resolversFor: lookup ])
		do: [ :e | 
			| type |
			type := aBlock cull: e cull: lookup.
			type isUnknown
				ifFalse: [ ^ type ] ].
	lookup hasSuperType
		ifTrue: [ lookup := lookup copyWithSuperType ] ] doWhileTrue: [ lookup hasSuperType ].
	^ TypUnknownType instance
]
