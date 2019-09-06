Class {
	#name : #TypMethodArgumentTypeRepository,
	#superclass : #TypTypeRepository,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypMethodArgumentTypeRepository >> initialize [
	<typTypeParametersAs: 'TypMethodLookup,TypMethodResolver<TypMethodLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'next' as: 'TypMethodResolver<TypMethodLookup>'>
	super initialize
]

{ #category : #accessing }
TypMethodArgumentTypeRepository >> typeAt: anInteger for: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self
		typeFor: aLookup
		using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]
