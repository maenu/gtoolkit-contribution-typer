Class {
	#name : #TypDynResolver,
	#superclass : #TypResolver,
	#instVars : [
		'results'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynResolver >> resolve: aLookup [
	<typPraResult: 'SequenceableCollection<TypLookupResult>'>
	<typPraArguments: 'TypObjectLookup'>
	^ (aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription ])
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
TypDynResolver >> results [
	<typPraResult: 'Dictionary<Association<ClassDescription,Symbol>,TypLookupResult>'>
	^ results
]

{ #category : #accessing }
TypDynResolver >> results: anObject [
	<typPraArguments: 'Dictionary<Association<ClassDescription,Symbol>,TypLookupResult>'>
	results := anObject
]
