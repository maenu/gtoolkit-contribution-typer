Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			(e classDescription typInfAsMethodLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :f | 
					{(f
						originalLookup: aLookup;
						resolvedLookup: aLookup;
						resolvedResolver: self;
						yourself)} ] ]
]
