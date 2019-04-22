Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypCachingMethodResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethodResolver >> selector [
	^ #typInfMethodResolverIndex
]
