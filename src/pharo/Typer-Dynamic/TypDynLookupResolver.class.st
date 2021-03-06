Class {
	#name : #TypDynLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'results'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypObjectLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypLookupResult>'>
	^ (aLookup receiver isNamed and: [ aLookup receiver hasClassDescription ])
		ifTrue: [ results
				at: aLookup receiver classDescription -> aLookup selector
				ifPresent: [ :e | 
					{(e copy
						originalLookup: aLookup;
						resolvedLookup: aLookup;
						resolvedResolver: self;
						yourself)} ]
				ifAbsent: [ #() ] ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
TypDynLookupResolver >> results [
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol>,TypLookupResult>'>
	^ results
]

{ #category : #accessing }
TypDynLookupResolver >> results: anObject [
	<typTypeArgument: 1 as: 'Dictionary<Association<ClassDescription,Symbol>,TypLookupResult>'>
	results := anObject
]
