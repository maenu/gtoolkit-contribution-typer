Class {
	#name : #TypInfTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTypeLookupResolver >> resolveBasic: aLookup [
	^ {(aLookup classDescription typAsNamedType
		addOrigin: aLookup asOrigin;
		yourself)}
]
