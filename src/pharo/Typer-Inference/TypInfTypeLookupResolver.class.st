Class {
	#name : #TypInfTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTypeLookupResolver >> canResolve: aLookup [
	^ true
]

{ #category : #accessing }
TypInfTypeLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup push: self.
	^ aLookup classDescription typAsNamedType
		addOrigin: aLookup asOrigin;
		yourself
]
