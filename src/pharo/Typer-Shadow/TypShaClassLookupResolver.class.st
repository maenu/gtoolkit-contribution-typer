Class {
	#name : #TypShaClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassLookupResult>'>
	^ ((aLookup clazz typShaShadows collect: #asClassLookupResult)
		reject: #isNil)
		do: [ :e | 
			e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
