Class {
	#name : #TypDynLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'results'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypObjectLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypLookupResult>'>
	^ aLookup receiverType representsClass
		ifTrue: [ results
				at: aLookup receiverType asClass -> aLookup selector
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
