Class {
	#name : #TypInfClassDescriptionLookupResult,
	#superclass : #TypTypeLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfClassDescriptionLookupResult >> type [
	^ lookup classDescription typAsNamedType
]
