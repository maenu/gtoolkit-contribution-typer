Class {
	#name : #TypInfClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typInfAsClassLookupResult
				ifNotNil: [ :e | 
					e copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
