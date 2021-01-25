Class {
	#name : #TypPraClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ {(TypPraClassDescriptionLookupResult new
		originalLookup: aLookup;
		resolvedLookup: aLookup;
		resolvedResolver: self;
		yourself)}
]
