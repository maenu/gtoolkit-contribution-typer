Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers class >> global [
	<typTypeResultAs: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	^ super global "typCastAs TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>"
]

{ #category : #accessing }
TypMethodResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	
]

{ #category : #accessing }
TypMethodResolvers class >> initializeGlobal [
	<typTypeResultAs: 'TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>'>
	^ (super initializeGlobal "typCastAs TypMethodResolvers<TypMethodLookup,TypMethodResolver<TypMethodLookup>>")
		defaultResolver: TypDefaultMethodResolver new;
		yourself
]

{ #category : #initialization }
TypMethodResolvers >> initialize [
	<typTypeParametersAs: 'TypMethodLookup,TypMethodResolver<TypMethodLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypMethodLookup>'>
	super initialize
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
