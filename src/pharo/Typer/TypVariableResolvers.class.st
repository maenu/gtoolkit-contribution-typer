Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypVariableLookup typAsType};
		yourself
]

{ #category : #initialization }
TypVariableResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypVariableLookup>>'>
	super initialize
]

{ #category : #initialization }
TypVariableResolvers >> typeFor: anAssociation using: aBlock [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeArgument: 2 as: 'BlockClosure<TypResolver<TypVariableLookup>,TypVariableLookup,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ super typeFor: anAssociation using: aBlock
]

{ #category : #accessing }
TypVariableResolvers >> typeForVariable: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ]
]
