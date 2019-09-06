Class {
	#name : #TypVariableTypeRepository,
	#superclass : #TypTypeRepository,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypVariableTypeRepository >> initialize [
	<typTypeParametersAs: 'TypVariableLookup,TypVariableResolver<TypVariableLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	<typTypeVariable: 'next' as: 'TypVariableResolver<TypVariableLookup>'>
	super initialize
]

{ #category : #accessing }
TypVariableTypeRepository >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
