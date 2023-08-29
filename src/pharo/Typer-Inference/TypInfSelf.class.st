Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelf >> canResolve: aType method: aSymbol arguments: aCollection [
	^ context self
		canResolveMethod:  (self
				newLookup: aType
				method: aSymbol
				arguments: aCollection)
]

{ #category : #initialization }
TypInfSelf >> transfer [
	state at: self put: context self
]
