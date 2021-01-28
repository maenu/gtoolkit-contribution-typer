Class {
	#name : #TypInfClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ {(TypInfClassDescriptionLookupResult new
		resolvedLookup: aLookup;
		resolvedResolver: self;
		yourself)}
]
