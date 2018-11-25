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
	^ resolvers detect: [ :e | e resolves: anObject ] ifNone: [ nil ]
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
	resolvers anySatisfy: [ :e | e resolves: anObject ]
]
