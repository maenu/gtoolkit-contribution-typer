Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypVariableResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>'>
	
]

{ #category : #accessing }
TypVariableResolvers class >> instance [
	<typTypeResultAs: 'TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>'>
	^ super instance "typCastAs TypVariableResolvers<TypVariableLookup,TypVariableResolver<TypVariableLookup>>"
]

{ #category : #initialization }
TypVariableResolvers >> initialize [
	<typTypeParametersAs: 'TypVariableLookup,TypVariableResolver<TypVariableLookup>'>
	<typTypeParametersAs: 'TypVariableLookup'>
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypVariableResolver<TypVariableLookup>'>
	super initialize
]

{ #category : #accessing }
TypVariableResolvers >> typeForVariable: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
