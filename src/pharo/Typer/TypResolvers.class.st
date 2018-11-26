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
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #accessing }
TypResolvers >> resolverFor: anObject [
	self assert: [ self resolves: anObject ].
	^ resolvers detect: [ :e | e resolves: anObject ]
]

{ #category : #accessing }
TypResolvers >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypResolvers >> resolvers: anObject [
	resolvers := anObject
]

{ #category : #accessing }
TypResolvers >> resolves: anObject [
	^ resolvers anySatisfy: [ :e | e resolves: anObject ]
]

{ #category : #'as yet unclassified' }
TypResolvers >> typeFor: anAssociation using: aBlock [
	| association |
	association := anAssociation.
	[ ((resolvers select: [ :e | e resolves: association ]) collect: [ :e | e resolverFor: association ])
		do: [ :e | 
			| type |
			type := aBlock cull: e cull: association.
			type isUnknown
				ifFalse: [ ^ type ] ].
	association key hasSuperType
		ifTrue: [ association := association key superType -> association value ] ] doWhileTrue: [ association key hasSuperType ].
	^ TypUnknownType instance
]
