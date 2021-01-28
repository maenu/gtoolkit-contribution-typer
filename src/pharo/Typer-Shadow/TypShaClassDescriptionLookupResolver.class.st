Class {
	#name : #TypShaClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ aLookup classDescription typShaShadows
		collect: [ :f | 
			(TypShaClassDescriptionLookupResult shadow: f)
				resolvedLookup: aLookup;
				resolvedResolver: self;
				yourself ]
]
