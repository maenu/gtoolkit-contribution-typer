Class {
	#name : #TypShaMethodResolvers,
	#superclass : #TypShaResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #initialization }
TypShaMethodResolvers >> initialize [
	super initialize.
	resolvers := #asMethodResolvers
]

{ #category : #accessing }
TypShaMethodResolvers >> resolversFor: aLookup [
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup receiverType asClass
]

{ #category : #'as yet unclassified' }
TypShaMethodResolvers >> resolves: aLookup [
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	^ self resolves: aLookup shadowing: aLookup receiverType asClass
]
