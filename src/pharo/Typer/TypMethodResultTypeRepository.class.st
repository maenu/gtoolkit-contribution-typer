Class {
	#name : #TypMethodResultTypeRepository,
	#superclass : #TypTypeRepository,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypMethodResultTypeRepository >> initialize [
	<typTypeParametersAs: 'TypMethodLookup,TypMethodResolver<TypMethodLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'next' as: 'TypMethodResolver<TypMethodLookup>'>
	super initialize
]

{ #category : #accessing }
TypMethodResultTypeRepository >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ]
]
