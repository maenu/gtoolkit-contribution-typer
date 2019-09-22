Class {
	#name : #TypInfClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassLookupResult>'>
	^ aLookup classDescription typInfAsClassLookupResult
		ifNil: [ #() ]
		ifNotNil: [ :e | 
			{(e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself)} ]
]
