Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> lookup: aType method: aSymbol arguments: aCollection [
	^ context super
		resolveMethod: (TypMethodLookup
				receiver: context super
				selector: aSymbol
				arguments: aCollection
				self: context self
				super: context super superOrNil
				parent: nil)
]

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: context super
]
