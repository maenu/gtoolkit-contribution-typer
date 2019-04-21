Class {
	#name : #TypInfTypeResolver,
	#superclass : #TypTypeResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfTypeResolver >> initialize [
	super initialize.
	self type: [ :a | a clazz typAsNamedType ]
]
