Class {
	#name : #TypChainableTypeResolvers,
	#superclass : #TypChainableResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypChainableTypeResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>'>
	
]

{ #category : #accessing }
TypChainableTypeResolvers class >> instance [
	<typTypeResultAs: 'TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>'>
	^ super instance "typCastAs TypTypeResolvers<TypTypeLookup,TypTypeResolver<TypTypeLookup>>"
]

{ #category : #initialization }
TypChainableTypeResolvers >> initialize [
	<typTypeParametersAs: 'TypTypeLookup,TypTypeResolver<TypTypeLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	<typTypeVariable: 'next' as: 'TypTypeResolver<TypTypeLookup>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypChainableTypeResolvers >> typeForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
