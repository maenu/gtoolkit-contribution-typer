Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			(e classDescription typInfAsVariableLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :f | 
					{(f
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ] ]
]
