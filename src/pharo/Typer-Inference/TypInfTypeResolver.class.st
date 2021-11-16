Class {
	#name : 'TypInfTypeResolver',
	#superclass : 'TypResolver',
	#category : 'Typer-Inference'
}

{ #category : 'accessing' }
TypInfTypeResolver >> canResolve: aLookup [
	^ true
]

{ #category : 'accessing' }
TypInfTypeResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup classDescription typAsNamedType
]
