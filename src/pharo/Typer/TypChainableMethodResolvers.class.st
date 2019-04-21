Class {
	#name : #TypChainableMethodResolvers,
	#superclass : #TypChainableResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypChainableMethodResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	
]

{ #category : #accessing }
TypChainableMethodResolvers class >> instance [
	<typTypeResultAs: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	^ super instance "typCastAs TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>"
]

{ #category : #initialization }
TypChainableMethodResolvers >> initialize [
	<typTypeParametersAs: 'TypMethodLookup,TypMethodResolver<TypMethodLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'next' as: 'TypMethodResolver<TypMethodLookup>'>
	super initialize
]

{ #category : #accessing }
TypChainableMethodResolvers >> signalsAlways: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!Boolean'>
	self
		resolve: aLookup
		using: [ :r :a | 
			| signalsAlways |
			signalsAlways := [ r signalsAlwaysFor: aLookup resolvedBy: a ]
				on: TypNoCompatibleTypeError
				do: [ ^ nil ].
			signalsAlways ifNotNil: [ ^ signalsAlways ] ].
	(next isNotNil and: [ next resolves: aLookup ])
		ifTrue: [ ^ [ next signalsAlwaysFor: aLookup resolvedBy: aLookup ]
				on: TypNoCompatibleTypeError
				do: [ ^ nil ] ].
	^ nil
]

{ #category : #accessing }
TypChainableMethodResolvers >> typeForArgumentAt: anInteger ofMethod: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]

{ #category : #accessing }
TypChainableMethodResolvers >> typeForResultOfMethod: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ]
]
