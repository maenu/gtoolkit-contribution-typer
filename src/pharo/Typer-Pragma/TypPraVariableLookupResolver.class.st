Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		collect: [ :e | 
			TypPraVariableLookupResult new
				resolvedLookup: aLookup;
				resolvedResolver: self;
				yourself ]
]
