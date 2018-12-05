Class {
	#name : #TypInferredTypeResolver,
	#superclass : #TypInferredResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypInferredTypeResolver >> initialize [
	<typTypeVariable: 'cache' as: 'Dictionary<TypTypeLookup,TypType>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypInferredTypeResolver >> typForClass: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typeFor: aLookup using: [ :r :a | r typeFor: aLookup resolvedBy: a ].
	type isUnknown
		ifTrue: [ "default to named type" ^ aLookup clazz typAsNamedType ].
	^ type
]
