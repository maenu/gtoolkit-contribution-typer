Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelf >> newMethodLookups: aMessage [
	^ {TypMethodLookup
			receiver: context self
			selector: aMessage selector
			arguments: aMessage arguments
			self: context self
			super: context super}
]

{ #category : #initialization }
TypInfSelf >> transfer [
	state at: self put: context self
]
