Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typPraAsVariableLookupResultFor: aLookup selector)
				ifNotNil: [ :e | 
					e
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
