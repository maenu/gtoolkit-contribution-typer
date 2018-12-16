Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypVariableResolvers class >> global [
	<typTypeResultAs: 'TypVariableResolvers'>
	^ super global
]

{ #category : #accessing }
TypVariableResolvers class >> initialize [
	<typTypeVariable: 'global' as: 'TypVariableResolvers'>
	
]

{ #category : #accessing }
TypVariableResolvers class >> initializeGlobal [
	<typTypeResultAs: 'TypVariableResolvers'>
	^ super initializeGlobal
		defaultResolver: TypDefaultVariableResolver new;
		yourself
]

{ #category : #initialization }
TypVariableResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	<typTypeVariable: 'defaultResolver' as: 'TypResolver<TypVariableLookup>'>
	super initialize
]

{ #category : #accessing }
TypVariableResolvers >> typeForVariable: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
