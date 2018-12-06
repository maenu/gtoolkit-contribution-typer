Class {
	#name : #TypDefaultTypeResolver,
	#superclass : #TypTypeResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypDefaultTypeResolver >> initialize [
	super initialize.
	self type: [ :a | a clazz typAsNamedType ]
]
