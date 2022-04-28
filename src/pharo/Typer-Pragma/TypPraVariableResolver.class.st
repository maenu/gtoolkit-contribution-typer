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

{ #category : #printing }
TypPraVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'pra variable'
]

{ #category : #accessing }
TypPraVariableResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ aLookup receiver classDescription typPraVariable: aLookup selector
]
