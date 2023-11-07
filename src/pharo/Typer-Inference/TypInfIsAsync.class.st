Class {
	#name : #TypInfIsAsync,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfIsAsync class >> do: aBlock [
	^ self value: true during: aBlock
]

{ #category : #accessing }
TypInfIsAsync class >> value [
	^ super value ifNil: [ false ]
]
