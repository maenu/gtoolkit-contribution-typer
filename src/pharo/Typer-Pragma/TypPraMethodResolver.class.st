Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription typPraHasMethod: aLookup selector ] ]
]

{ #category : #accessing }
TypPraMethodResolver >> resolve: aLookup [

	| resolved |
	self assert: [ self canResolve: aLookup ].
	resolved := aLookup receiver classDescription typPraMethod:
		            aLookup selector.
	self
		addDependent: aLookup label: #resolve:;
		addDependent: resolved
		label: #pragma
		data: aLookup receiver classDescription >> aLookup selector.
	^ aLookup addDependent: resolved label: #resolved data: self
]
