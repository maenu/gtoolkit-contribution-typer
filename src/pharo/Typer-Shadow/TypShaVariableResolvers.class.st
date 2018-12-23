Class {
	#name : #TypShaVariableResolvers,
	#superclass : #TypShaResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #initialization }
TypShaVariableResolvers >> initialize [
	<typTypeParametersAs: 'TypVariableLookup'>
	super initialize.
	resolvers := #asVariableResolvers
]

{ #category : #accessing }
TypShaVariableResolvers >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup receiverType asClass
]

{ #category : #accessing }
TypShaVariableResolvers >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'Boolean'>
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	^ self resolves: aLookup shadowing: aLookup receiverType asClass
]
