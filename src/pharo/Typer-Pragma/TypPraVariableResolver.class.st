Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Lookup'
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
TypPraVariableResolver >> result: aLookup [
	^ aLookup receiver classDescription typPraVariable: aLookup selector
]
