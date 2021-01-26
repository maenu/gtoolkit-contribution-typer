Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookup>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			e classDescription typShaShadows
				collect: [ :f | 
					(TypShaVariableLookupResult shadow: f name: aLookup selector)
						resolvedLookup: aLookup;
						resolvedResolver: self;
						yourself ] ]
]
