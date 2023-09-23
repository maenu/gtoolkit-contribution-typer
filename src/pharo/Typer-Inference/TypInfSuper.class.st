Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> newMethodLookup: aMessage [
	self super ifNil: [ ^ nil ].
	^ TypInfMethodLookup
		receiver: self super
		selector: aMessage selector
		arguments: aMessage arguments
		self: context self
		super: self super
		message: aMessage
		parent: nil
]

{ #category : #accessing }
TypInfSuper >> super [
	^ context super ifNil: nil ifNotNil: #superOrNil
]

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: (context super ifNil: TypNilType instance)
]
