Class {
	#name : #TypPraClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassLookupResult'>
	^ aLookup clazz typPraAsClassLookupResult
		ifNotNil: [ :e | 
			e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
