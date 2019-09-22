Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookupResult>'>
	^ aLookup receiverType representsClassDescription
		ifTrue: [ (aLookup receiverType classDescription
				typPraAsVariableLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :e | 
					{(e
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ] ]
		ifFalse: [ nil ]
]
