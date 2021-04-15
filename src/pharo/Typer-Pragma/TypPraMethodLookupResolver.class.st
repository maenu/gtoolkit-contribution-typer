Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription typPraHasMethod: aLookup selector ] ]
]

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (aLookup receiver classDescription typPraMethod: aLookup selector)
		addOrigin: (TypLookupOrigin lookup: aLookup);
		yourself
]
