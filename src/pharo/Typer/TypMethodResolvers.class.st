Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypMethodResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>>'>
	super initialize
]

{ #category : #initialization }
TypMethodResolvers >> typeFor: anAssociation using: aBlock [
	<typTypeArgument: 1 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeArgument: 2 as: 'BlockClosure<TypResolver<Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ super typeFor: anAssociation using: aBlock
]

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: anAssociation [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: anAssociation using: [ :r :a | r argumentTypeAt: anInteger for: anAssociation resolvedBy: a ]
]

{ #category : #accessing }
TypMethodResolvers >> typeForResultOfMethod: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typeFor: anAssociation using: [ :r :a | r resultTypeFor: anAssociation resolvedBy: a ].
	(type isUnknown and: [ anAssociation key hasClass ])
		ifTrue: [ "assume self return if no explicit return"
			| method |
			method := anAssociation key asClass lookupSelector: anAssociation value key.
			(method isNotNil and: [ method isAbstract not and: [ (method ast allChildren select: #isReturn) isEmpty ] ])
				ifTrue: [ ^ anAssociation key ] ].
	^ type
]
