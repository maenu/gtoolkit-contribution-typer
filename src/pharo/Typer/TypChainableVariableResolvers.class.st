Class {
	#name : #TypChainableVariableResolvers,
	#superclass : #TypChainableResolvers,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypChainableVariableResolvers >> initialize [
	<typTypeParametersAs: 'TypVariableLookup,TypVariableResolver<TypVariableLookup>'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	<typTypeVariable: 'next' as: 'TypVariableResolver<TypVariableLookup>'>
	super initialize
]

{ #category : #accessing }
TypChainableVariableResolvers >> typeForVariable: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
