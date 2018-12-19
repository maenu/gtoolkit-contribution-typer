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

{ #category : #'as yet unclassified' }
TypShaVariableResolvers >> resolversFor: aLookup [
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup receiverType asClass
]

{ #category : #'as yet unclassified' }
TypShaVariableResolvers >> resolves: aLookup [
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	^ self resolves: aLookup shadowing: aLookup receiverType asClass
]
