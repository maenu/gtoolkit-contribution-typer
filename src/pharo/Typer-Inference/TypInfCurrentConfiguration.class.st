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
TypInfCurrentConfiguration class >> debugWithTally: aBlock [
	^ self value: TypInfConfiguration debug withTally during: aBlock
]

{ #category : #accessing }
TypInfCurrentConfiguration class >> default: aBlock [
	^ self value: TypInfConfiguration default during: aBlock
]

{ #category : #accessing }
TypInfCurrentConfiguration class >> defaultWithTally: aBlock [
	^ self value: TypInfConfiguration default withTally during: aBlock
]

{ #category : #accessing }
TypInfCurrentConfiguration class >> value [
	^ super value ifNil: [ TypInfConfiguration default ]
]
