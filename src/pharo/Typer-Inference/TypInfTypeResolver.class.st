Class {
	#name : #TypInfTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
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
TypInfTypeResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup classDescription typAsNamedType
]
