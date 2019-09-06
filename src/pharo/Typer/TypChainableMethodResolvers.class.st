Class {
	#name : #TypChainableMethodResolvers,
	#superclass : #TypChainableResolvers,
	#category : #'Typer-Core'
}

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
	<typTypeResultAs: 'TypLookupSignalsAlwaysResult'>
	self
		resolve: aLookup
		using: [ :r :a | 
			| result |
			result := [ r signalsAlwaysFor: aLookup resolvedBy: a ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupSignalsAlwaysResult new
						lookup: aLookup;
						resolvedBy: a;
						resolver: r;
						yourself ].
			result signalsAlways ifNotNil: [ ^ result ] ].
	^ next
		ifNil: [ TypLookupSignalsAlwaysResult new
				lookup: aLookup;
				yourself ]
		ifNotNil: [ [ next signalsAlways: aLookup ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupSignalsAlwaysResult new
						lookup: aLookup;
						yourself ] ]
]

{ #category : #accessing }
TypChainableMethodResolvers >> typeForArgumentAt: anInteger ofMethod: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]

{ #category : #accessing }
TypChainableMethodResolvers >> typeForResultOfMethod: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ]
]
