Class {
	#name : #TypInfClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ aLookup classDescription typInfAsClassDescriptionLookupResult
		ifNil: [ #() ]
		ifNotNil: [ :e | 
			{(e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself)} ]
]
