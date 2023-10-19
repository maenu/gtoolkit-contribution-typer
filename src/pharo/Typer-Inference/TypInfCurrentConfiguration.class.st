Class {
	#name : #TypInfCurrentConfiguration,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfCurrentConfiguration class >> debug: aBlock [
	^ self value: TypInfConfiguration debug during: aBlock
]

{ #category : #accessing }
TypInfCurrentConfiguration class >> default: aBlock [
	^ self value: TypInfConfiguration default during: aBlock
]

{ #category : #accessing }
TypInfCurrentConfiguration class >> value [
	^ super value ifNil: [ TypInfConfiguration default ]
]
