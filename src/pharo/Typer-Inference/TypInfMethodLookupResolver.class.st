Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	^ (aLookup receiverType isNamed and: [ aLookup receiverType hasClassDescription ])
		ifTrue: [ (aLookup receiverType classDescription
				typInfAsMethodLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :e | 
					{(e
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ] ]
		ifFalse: [ #() ]
]
