Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableResolver<TypVariableLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				ifEmpty: [ nil ]
				ifNotEmpty:
					[ :f | (f first asVariableResolverFor: aLookup selector) resolve: aLookup ] ]
		ifFalse: [ nil ]
]
