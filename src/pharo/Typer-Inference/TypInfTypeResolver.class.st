Class {
	#name : #TypInfTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfTypeResolver >> canResolve: aLookup [
	^ true
]

{ #category : #printing }
TypInfTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'inf type'
]

{ #category : #accessing }
TypInfTypeResolver >> result: aLookup [
	^ aLookup classDescription typAsNamedType
]
