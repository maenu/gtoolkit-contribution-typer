Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypMethodResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<TypMethodLookup>>'>
	super initialize
]

{ #category : #initialization }
TypMethodResolvers >> typeFor: aLookup using: aBlock [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'BlockClosure<TypMethodLookup,TypResolver<TypMethodLookup>,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ super typeFor: aLookup using: aBlock
]

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: aLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: aLookup using: [ :r :a | r argumentTypeAt: anInteger for: aLookup resolvedBy: a ]
]

{ #category : #accessing }
TypMethodResolvers >> typeForResultOfMethod: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typeFor: aLookup using: [ :r :a | r resultTypeFor: aLookup resolvedBy: a ].
	(type isUnknown and: [ aLookup receiverType hasClass ])
		ifTrue: [ "assume self return if no explicit return"
			| method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			(method isNotNil and: [ method isAbstract not and: [ (method ast allChildren select: #isReturn) isEmpty ] ])
				ifTrue: [ ^ aLookup receiverType ] ].
	^ type
]
