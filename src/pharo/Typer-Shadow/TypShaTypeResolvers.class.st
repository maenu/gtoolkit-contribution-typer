Class {
	#name : #TypShaTypeResolvers,
	#superclass : #TypShaResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #'as yet unclassified' }
TypShaTypeResolvers >> initialize [
	<typTypeParametersAs: 'TypTypeLookup'>
	super initialize.
	resolvers := #asTypeResolvers
]

{ #category : #accessing }
TypShaTypeResolvers >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup clazz
]

{ #category : #accessing }
TypShaTypeResolvers >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'Boolean'>
	^ self resolves: aLookup shadowing: aLookup clazz
]
