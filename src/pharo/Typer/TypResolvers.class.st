Class {
	#name : #TypResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers',
		'defaultResolver'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypResolvers<TypLookup,TypResolver<TypLookup>>'>
	
]

{ #category : #accessing }
TypResolvers class >> instance [
	<typTypeResultAs: 'TypResolvers<TypLookup,TypResolver<TypLookup>>'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypResolvers class >> reset [
	instance := nil
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
	<typTypeParametersAs: 'TypLookup,TypResolver<TypLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypLookup>'>
	super initialize.
	resolvers := OrderedCollection new "typParameters TypResolver<TypLookup>"
]

{ #category : #accessing }
TypResolvers >> resolve: aLookup using: aBlock [
	| lookup |
	lookup := aLookup copy.
	[ (self resolversFor: lookup)
		do: [ :r | aBlock cull: r cull: lookup ].
	lookup hasSuperType
		ifTrue: [ lookup adaptWithSuperType.
			true ]
		ifFalse: [ false ] ] whileTrue
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
	self
		resolve: aLookup
		using: [ :r :a | 
			| type |
			type := [ aBlock cull: r cull: a ]
				on: TypNoCompatibleTypeError
				do: [ ^ TypUnknownType instance ].
			type isUnknown
				ifFalse: [ ^ type ] ].
	(defaultResolver isNotNil and: [ defaultResolver resolves: aLookup ])
		ifTrue: [ ^ [ aBlock cull: defaultResolver cull: aLookup ]
				on: TypNoCompatibleTypeError
				do: [ ^ TypUnknownType instance ] ].
	^ TypUnknownType instance
]
