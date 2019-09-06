Class {
	#name : #TypClassTypeRepository,
	#superclass : #TypTypeRepository,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypClassTypeRepository >> initialize [
	<typTypeParametersAs: 'TypTypeLookup,TypTypeResolver<TypTypeLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	<typTypeVariable: 'next' as: 'TypTypeResolver<TypTypeLookup>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypClassTypeRepository >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
