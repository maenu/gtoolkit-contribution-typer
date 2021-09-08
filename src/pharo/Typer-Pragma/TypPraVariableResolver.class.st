Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription
						typPraHasVariable: aLookup selector ] ]
]

{ #category : #accessing }
TypPraVariableResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ (aLookup receiver classDescription typPraVariable: aLookup selector) 
		  copyWithOrigins: { (TypLookupOrigin lookup: aLookup) }
]
