Class {
	#name : #TypChainableVariableResolvers,
	#superclass : #TypChainableResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypChainableVariableResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>'>
	
]

{ #category : #accessing }
TypChainableVariableResolvers class >> instance [
	<typTypeResultAs: 'TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>'>
	^ super instance "typCastAs TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>"
]

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
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
