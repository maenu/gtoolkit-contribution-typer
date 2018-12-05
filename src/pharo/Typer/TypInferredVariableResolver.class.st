Class {
	#name : #TypInferredVariableResolver,
	#superclass : #TypInferredResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypInferredVariableResolver >> initialize [
	<typTypeVariable: 'cache' as: 'Dictionary<TypVariableLookup,TypType>'>
	super initialize
]

{ #category : #accessing }
TypInferredVariableResolver >> typeForVariable: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
