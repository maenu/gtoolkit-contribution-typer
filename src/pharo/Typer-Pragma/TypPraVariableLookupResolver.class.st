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
	^ (aLookup receiver classDescription typPraVariable: aLookup selector) 
		  copyWithOrigins: { (TypLookupOrigin lookup: aLookup) }
]
