Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typInfAsVariableLookupResultFor: aLookup selector)
				ifNotNil: [ :e | 
					e copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
