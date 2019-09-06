Class {
	#name : #TypRepository,
	#superclass : #Object,
	#instVars : [
		'resolvers',
		'next'
	],
	#category : #'Typer-Core'
}

{ #category : #'instance creation' }
TypRepository class >> resolvers: aCollection [
	^ self new
		resolvers: aCollection;
		yourself
]

{ #category : #accessing }
TypRepository >> defaultResultFor: aLookup [
	self subclassResponsibility
]

{ #category : #initialization }
TypRepository >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	super initialize.
	resolvers := OrderedCollection new "typParameters TypResolver<TypLookup>"
]

{ #category : #accessing }
TypRepository >> next [
	^ next
]

{ #category : #accessing }
TypRepository >> next: anObject [
	next := anObject
]

{ #category : #accessing }
TypRepository >> resolve: aLookup using: aBlock [
	| lookup |
	lookup := aLookup.
	[ resolvers
		do:
			[ :e | (e resolversFor: lookup) do: [ :r | aBlock cull: r cull: lookup ] ].
	lookup hasSuperType
		ifTrue: [ lookup == aLookup
				ifTrue: [ "copy as late as possible" lookup := aLookup copy ].
			lookup adaptWithSuperType.
			true ]
		ifFalse: [ false ] ] whileTrue
]

{ #category : #accessing }
TypRepository >> resolvers [
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypRepository >> resolvers: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypResolver<TypLookup>>'>
	resolvers := anObject copy asOrderedCollection
]
