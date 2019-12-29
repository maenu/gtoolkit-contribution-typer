Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			(e classDescription typPraAsVariableLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :f | 
					{(f
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ] ]
]
