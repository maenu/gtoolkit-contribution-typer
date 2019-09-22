Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	^ aLookup receiverType representsClass
		ifTrue: [ ((aLookup receiverType asClass typShaShadows
				collect: [ :e | e asMethodLookupResultFor: aLookup selector ])
				reject: #isNil)
				do: [ :e | 
					e
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ #() ]
]
