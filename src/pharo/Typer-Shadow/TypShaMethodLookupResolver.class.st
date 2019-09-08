Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodResolver<TypMethodLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				ifEmpty: [ nil ]
				ifNotEmpty:
					[ :f | (f first asMethodResolverFor: aLookup selector) resolve: aLookup ] ]
		ifFalse: [ nil ]
]
