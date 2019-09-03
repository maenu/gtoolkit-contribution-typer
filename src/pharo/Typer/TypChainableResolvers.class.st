Class {
	#name : #TypChainableResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers',
		'next'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypChainableResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypResolvers<TypLookup,TypResolver<TypLookup>>'>
	
]

{ #category : #accessing }
TypChainableResolvers class >> instance [
	<typTypeResultAs: 'TypResolvers<TypLookup,TypResolver<TypLookup>>'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypChainableResolvers class >> reset [
	instance := nil
]

{ #category : #adding }
TypChainableResolvers >> add: aResolver [
	<typTypeArgumentAt: 1 as: 'TypResolver<TypLookup>'>
	resolvers add: aResolver
]

{ #category : #initialization }
TypChainableResolvers >> initialize [
	<typTypeParametersAs: 'TypLookup,TypResolver<TypLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypLookup>'>
	super initialize.
	resolvers := OrderedCollection new "typParameters TypResolver<TypLookup>"
]

{ #category : #accessing }
TypChainableResolvers >> next [
	<typTypeResultAs: 'TypResolver<TypLookup>'>
	^ next
]

{ #category : #accessing }
TypChainableResolvers >> next: anObject [
	<typTypeArgument: 1 as: 'TypResolver<TypLookup>'>
	next := anObject
]

{ #category : #accessing }
TypChainableResolvers >> resolve: aLookup using: aBlock [
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
TypChainableResolvers >> resolvers [
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypChainableResolvers >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	resolvers := anObject
]

{ #category : #'as yet unclassified' }
TypChainableResolvers >> resolversFor: aLookup [
	^ resolvers flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypChainableResolvers >> typeFor: aLookup using: aBlock [
	self
		resolve: aLookup
		using: [ :r :a | 
			| type |
			type := [ aBlock cull: r cull: a ]
				on: TypNoCompatibleTypeError
				do: [ ^ TypUnknownType instance ].
			type isUnknown
				ifFalse: [ ^ type ] ].
	next
		ifNotNil: [ ^ [ next typeFor: aLookup using: aBlock ]
				on: TypNoCompatibleTypeError
				do: [ ^ TypUnknownType instance ] ].
	^ TypUnknownType instance
]
