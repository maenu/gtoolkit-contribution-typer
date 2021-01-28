Class {
	#name : #TypPraClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ {(TypPraClassDescriptionLookupResult new
		resolvedLookup: aLookup;
		resolvedResolver: self;
		yourself)}
]
