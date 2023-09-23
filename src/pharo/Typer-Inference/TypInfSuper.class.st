Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> newMethodLookup: aMessage [
	context super ifNil: [ ^ nil ].
	^ TypMethodLookup
		receiver: context super
		selector: aMessage selector
		arguments: aMessage arguments
		self: context self
		super: (context super ifNil: nil ifNotNil: #superOrNil)
		parent: nil
]

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: (context super ifNil: TypNilType instance)
]
