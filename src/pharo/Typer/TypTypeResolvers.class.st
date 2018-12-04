Class {
	#name : #TypTypeResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypTypeResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypTypeLookup>>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypTypeResolvers >> typForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ].
	type isUnknown
		ifTrue: [ "default to named type" ^ aLookup clazz typAsNamedType ].
	^ type
]

{ #category : #accessing }
TypTypeResolvers >> typeFor: aLookup using: aBlock [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeArgument: 2 as: 'BlockClosure<TypResolver<TypTypeLookup>,TypTypeLookup,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ super typeFor: aLookup using: aBlock
]
