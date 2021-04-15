Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription
						typPraHasVariable: aLookup selector ] ]
]

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	self flag: 'FIXME parameters not covered yet, scopes'.
	^ (aLookup receiver classDescription typPraVariable: aLookup selector)
		addOrigin: (TypLookupOrigin lookup: aLookup);
		yourself
]
