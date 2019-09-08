Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typInfAsMethodLookupResultFor: aLookup selector)
				ifNotNil: [ :e | 
					e copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
