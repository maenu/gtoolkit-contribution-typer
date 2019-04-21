Class {
	#name : #TypTypeResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypTypeResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>'>
	
]

{ #category : #accessing }
TypTypeResolvers class >> instance [
	<typTypeResultAs: 'TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>'>
	^ super instance "typCastAs TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>"
]

{ #category : #initialization }
TypTypeResolvers >> initialize [
	<typTypeParametersAs: 'TypTypeLookup,TypTypeResolver<TypTypeLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypTypeResolver<TypTypeLookup>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypTypeResolvers >> typForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
