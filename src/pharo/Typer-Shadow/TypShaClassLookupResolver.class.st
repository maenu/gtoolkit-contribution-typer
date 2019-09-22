Class {
	#name : #TypShaClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassLookupResult>'>
	^ ((aLookup classDescription typShaShadows collect: #asClassLookupResult)
		reject: #isNil)
		do: [ :e | 
			e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
