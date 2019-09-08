Class {
	#name : #TypInfClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassLookupResult'>
	^ aLookup clazz typInfAsClassLookupResult
		ifNotNil: [ :e | 
			e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
