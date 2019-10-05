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
	^ (aLookup receiverType isNamed and: [ aLookup receiverType hasClassDescription ])
		ifTrue: [ results
				at: aLookup receiverType classDescription -> aLookup selector
				ifPresent: [ :e | 
					{(e copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ]
				ifAbsent: [ #() ] ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
TypDynLookupResolver >> results [
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypLookupResult>'>
	^ results
]

{ #category : #accessing }
TypDynLookupResolver >> results: anObject [
	<typTypeArgument: 1 as: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypLookupResult>'>
	results := anObject
]
