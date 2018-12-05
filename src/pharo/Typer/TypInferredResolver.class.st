Class {
	#name : #TypInferredResolver,
	#superclass : #TypResolver,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypInferredResolver >> initialize [
	<typTypeVariable: 'cache' as: 'Dictionary<TypLookup,TypType>'>
	super initialize.
	cache := Dictionary new
]

{ #category : #accessing }
TypInferredResolver >> resolves: aLookup [
	^ true
]

{ #category : #accessing }
TypInferredResolver >> typeFor: aLookup using: aBlock [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'BlockClosure<TypLookup,TypType>'>
	<typTypeResultAs: 'TypType'>
	cache at: aLookup ifPresent: [ :e | ^ e ].
	cache at: aLookup put: TypUnknownType instance.
	^ cache at: aLookup put: (aBlock cull: aLookup)
]
