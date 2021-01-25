Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			((e classDescription typShaShadows
				collect: [ :f | f asMethodLookupResultFor: aLookup selector ])
				reject: #isNil)
				collect: [ :f | 
					f copy
						originalLookup: aLookup;
						resolvedLookup: aLookup;
						resolvedResolver: self;
						yourself ] ]
]
