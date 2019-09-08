Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typPraAsMethodLookupResultFor: aLookup selector)
				ifNotNil: [ :e | 
					e
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
