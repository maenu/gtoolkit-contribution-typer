Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription typPraHasMethod: aLookup selector
]

{ #category : #printing }
TypPraMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'pra method'
]

{ #category : #accessing }
TypPraMethodResolver >> result: aLookup [
	^ aLookup receiver classDescription typPraMethod: aLookup selector
]
