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

{ #category : #printing }
TypPraMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'pra method'
]

{ #category : #accessing }
TypPraMethodResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ aLookup receiver classDescription typPraMethod: aLookup selector
]
