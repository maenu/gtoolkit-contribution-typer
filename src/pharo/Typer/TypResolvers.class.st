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

{ #category : #accessing }
TypResolvers class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
TypResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypLookup>>'>
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
TypResolvers >> resolverFor: aLookup [
	self assert: [ self resolves: aLookup ].
	^ (resolvers detect: [ :e | e resolves: aLookup ]) resolverFor: aLookup
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
	[ ((resolvers select: [ :e | e resolves: lookup ]) collect: [ :e | e resolverFor: lookup ])
		do: [ :e | 
			| type |
			type := aBlock cull: e cull: lookup.
			type isUnknown
				ifFalse: [ ^ type ] ].
	lookup hasSuperType
		ifTrue: [ lookup := lookup copyWithSuperType ] ] doWhileTrue: [ lookup hasSuperType ].
	^ TypUnknownType instance
]
