Class {
	#name : #TypTypeResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypTypeResolvers class >> initializeGlobal [
	^ super initializeGlobal
		defaultResolver: TypDefaultTypeResolver new;
		yourself
]

{ #category : #initialization }
TypTypeResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypTypeLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypTypeLookup>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypTypeResolvers >> typForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
