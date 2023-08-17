Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelf >> lookup: aType method: aSymbol arguments: aCollection [
	^ context self
		resolveMethod: (TypMethodLookup
				receiver: context self
				selector: aSymbol
				arguments: aCollection
				self: context self
				super: context super
				parent: nil)
]

{ #category : #initialization }
TypInfSelf >> transfer [
	state at: self put: context self
]
