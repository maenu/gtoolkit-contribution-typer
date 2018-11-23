Class {
	#name : #TypMethodResolvers,
	#superclass : #Object,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
TypMethodResolvers >> initialize [
	super initialize.
	resolvers := OrderedCollection new.
	resolvers addFirst: TypMethodResolver new
]

{ #category : #initialization }
TypMethodResolvers >> resolverFor: aCompiledMethod [
	^ (resolvers detect: [ :e | e resolves: aCompiledMethod ]) resolverFor: aCompiledMethod
]

{ #category : #accessing }
TypMethodResolvers >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypMethodResolvers >> resolvers: anObject [
	resolvers := anObject
]
