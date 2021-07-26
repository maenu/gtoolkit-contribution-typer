Class {
	#name : #TypInfSelf,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfSelf class >> value [
	^ super value ifNil: [ TypUnknownType new ]
]
