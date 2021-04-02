Class {
	#name : #TypInfTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTypeLookupResolver >> resolve: aLookup [
	aLookup push: self.
	^ aLookup classDescription typAsNamedType
		addOrigin: aLookup asOrigin;
		yourself
]
