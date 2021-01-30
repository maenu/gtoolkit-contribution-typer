Class {
	#name : #TypInfClassDescriptionLookupResult,
	#superclass : #TypClassDescriptionLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfClassDescriptionLookupResult >> type [
	^ lookup classDescription typAsNamedType
]
