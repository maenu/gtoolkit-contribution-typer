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
			((e classDescription typShaShadows
				collect: [ :f | f asVariableLookupResultFor: aLookup selector ])
				reject: #isNil)
				do: [ :f | 
					f copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
]
