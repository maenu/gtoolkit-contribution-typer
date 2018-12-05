Class {
	#name : #TypInferredMethodResolver,
	#superclass : #TypInferredResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypInferredMethodResolver >> initialize [
	<typTypeVariable: 'cache' as: 'Dictionary<TypMethodLookup,TypType>'>
	super initialize
]

{ #category : #accessing }
TypInferredMethodResolver >> typeForArgumentAt: anInteger ofMethod: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]

{ #category : #accessing }
TypInferredMethodResolver >> typeForResultOfMethod: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ].
	(type isUnknown and: [ aLookup receiverType hasClass ])
		ifTrue: [ "assume self return if no explicit return"
			| method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			(method isNotNil and: [ method isAbstract not and: [ method ast typIsReturnSelf ] ])
				ifTrue: [ ^ aLookup receiverType ] ].
	^ type
]
