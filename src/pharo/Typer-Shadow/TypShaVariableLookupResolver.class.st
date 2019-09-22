Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ ((aLookup receiverType asClass typShaShadows
				collect: [ :e | e asVariableLookupResultFor: aLookup selector ])
				reject: #isNil)
				do: [ :e | 
					e copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ #() ]
]
