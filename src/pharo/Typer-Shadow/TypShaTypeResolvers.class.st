Class {
	#name : #TypShaTypeResolvers,
	#superclass : #TypShaResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #'as yet unclassified' }
TypShaTypeResolvers >> initialize [
	super initialize.
	resolvers := #asTypeResolvers
]

{ #category : #'as yet unclassified' }
TypShaTypeResolvers >> resolversFor: aLookup [
	self assert: [ self resolves: aLookup ].
	^ self resolversFor: aLookup shadowing: aLookup clazz
]

{ #category : #'as yet unclassified' }
TypShaTypeResolvers >> resolves: aLookup [
	^ self resolves: aLookup shadowing: aLookup clazz
]
