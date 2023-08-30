Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelf >> newMethodLookup: aMessage [
	^ TypMethodLookup
		receiver: context self
		selector: aMessage selector
		arguments: aMessage arguments
		parent: nil
]

{ #category : #initialization }
TypInfSelf >> transfer [
	state at: self put: context self
]
