Class {
	#name : #TypResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypResolvers class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
TypResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<?>>'>
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
TypResolvers >> resolverFor: anAssociation [
	self assert: [ self resolves: anAssociation ].
	^ (resolvers detect: [ :e | e resolves: anAssociation ]) resolverFor: anAssociation
]

{ #category : #accessing }
TypResolvers >> resolvers [
	<typTypeResultAs: 'OrderedCollection<TypResolver<?>>'>
	^ resolvers
]

{ #category : #accessing }
TypResolvers >> resolvers: anObject [
	<typTypeArgument: 1 as: 'OrderedCollection<TypResolver<?>>'>
	resolvers := anObject
]

{ #category : #accessing }
TypResolvers >> resolves: anAssociation [
	^ resolvers anySatisfy: [ :e | e resolves: anAssociation ]
]

{ #category : #accessing }
TypResolvers >> typeFor: anAssociation using: aBlock [
	<typTypeArgument: 1 as: 'Association<TypType,?>'>
	<typTypeArgument: 2 as: 'BlockClosure<TypType,TypType>'>
	<typTypeResultAs: 'TypType'>
	| association |
	association := anAssociation.
	[ ((resolvers select: [ :e | e resolves: association ]) collect: [ :e | e resolverFor: association ]) "typParameters TypResolver<?>"
		do: [ :e | 
			| type |
			type := aBlock cull: e cull: association.
			type isUnknown
				ifFalse: [ ^ type ] ].
	association key hasSuperType
		ifTrue: [ association := association key superType -> association value ] ] doWhileTrue: [ association key hasSuperType ].
	^ TypUnknownType instance
]
