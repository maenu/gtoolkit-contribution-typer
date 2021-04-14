Class {
	#name : #TypPraTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeLookupResolver >> canResolve: aLookup [
	^ aLookup classDescription typPraHasType
]

{ #category : #accessing }
TypPraTypeLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup classDescription typPraType
]
