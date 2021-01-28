Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		collect: [ :e | 
			TypInfVariableLookupResult new
				resolvedLookup: aLookup;
				resolvedResolver: self;
				yourself ]
]
