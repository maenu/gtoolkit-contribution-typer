Class {
	#name : #TypChainableResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers',
		'next'
	],
	#category : #'Typer-Core'
}

{ #category : #'instance creation' }
TypChainableResolvers class >> withAll: aCollection [
	| instance |
	instance := self new.
	instance resolvers addAll: aCollection.
	^ instance
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
	lookup := aLookup.
	[ (self resolversFor: lookup)
		whileHasNext: [ :r | aBlock cull: r cull: lookup ].
	lookup hasSuperType
		ifTrue: [ lookup == aLookup
				ifTrue: [ "copy as late as possible" lookup := aLookup copy ].
			lookup adaptWithSuperType.
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
	^ TypIteratorIterator new
		iterators: (resolvers collect: [ :e | e resolversFor: aLookup ]);
		yourself
]

{ #category : #accessing }
TypChainableResolvers >> typeFor: aLookup using: aBlock [
	self
		resolve: aLookup
		using: [ :r :a | 
			| result |
			result := [ aBlock cull: r cull: a ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupTypeResult new
						type: TypUnknownType instance;
						lookup: aLookup;
						resolvedBy: a;
						resolver: r;
						yourself ].
			result type isUnknown
				ifFalse: [ ^ result ] ].
	^ next
		ifNil: [ TypLookupTypeResult new
				type: TypUnknownType instance;
				lookup: aLookup;
				yourself ]
		ifNotNil: [ [ next typeFor: aLookup using: aBlock ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupTypeResult new
						type: TypUnknownType instance;
						lookup: aLookup;
						yourself ] ]
]
