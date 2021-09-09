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

	| resolved |
	self assert: [ self canResolve: aLookup ].
	resolved := aLookup receiver classDescription typPraVariable:
		            aLookup selector.
	self
		addDependent: aLookup label: #resolve:;
		addDependent: resolved
		label: #pragma
		data: aLookup receiver classDescription class >> #initialize.
	^ aLookup addDependent: resolved label: #resolved data: self
]
