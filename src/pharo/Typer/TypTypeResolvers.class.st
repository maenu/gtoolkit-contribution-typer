Class {
	#name : #TypTypeResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypTypeResolvers class >> global [
	<typTypeResultAs: 'TypTypeResolvers'>
	^ super global
]

{ #category : #accessing }
TypTypeResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypTypeResolvers'>
	
]

{ #category : #accessing }
TypTypeResolvers class >> initializeGlobal [
	<typTypeResultAs: 'TypTypeResolvers'>
	^ super initializeGlobal
		defaultResolver: TypDefaultTypeResolver new;
		yourself
]

{ #category : #initialization }
TypTypeResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypTypeLookup>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypTypeResolvers >> typForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
