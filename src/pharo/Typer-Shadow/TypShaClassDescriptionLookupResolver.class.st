Class {
	#name : #TypShaClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ ((aLookup classDescription typShaShadows collect: #asClassDescriptionLookupResult)
		reject: #isNil)
		do: [ :e | 
			e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
