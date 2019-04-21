Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	
]

{ #category : #accessing }
TypMethodResolvers class >> instance [
	<typTypeResultAs: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	^ super instance "typCastAs TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>"
]

{ #category : #initialization }
TypMethodResolvers >> initialize [
	<typTypeParametersAs: 'TypMethodLookup,TypMethodResolver<TypMethodLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypMethodResolver<TypMethodLookup>'>
	super initialize
]

{ #category : #accessing }
TypMethodResolvers >> signalsAlways: aLookup [
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
	(defaultResolver isNotNil and: [ defaultResolver resolves: aLookup ])
		ifTrue: [ ^ [ defaultResolver signalsAlwaysFor: aLookup resolvedBy: aLookup ]
				on: TypNoCompatibleTypeError
				do: [ ^ nil ] ].
	^ nil
]

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]

{ #category : #accessing }
TypMethodResolvers >> typeForResultOfMethod: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ]
]
