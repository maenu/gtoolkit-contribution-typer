Class {
	#name : #TypShaMethodResolvers,
	#superclass : #TypShaResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #initialization }
TypShaMethodResolvers >> initialize [
	<typTypeParametersAs: 'TypMethodLookup'>
	super initialize.
	resolvers := #asMethodResolvers
]

{ #category : #accessing }
TypShaMethodResolvers >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup receiverType asClass
]

{ #category : #accessing }
TypShaMethodResolvers >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'Boolean'>
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	^ self resolves: aLookup shadowing: aLookup receiverType asClass
]
