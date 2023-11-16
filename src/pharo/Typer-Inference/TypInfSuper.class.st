Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> newMethodLookups: aMessage [
	context super ifNil: [ ^ nil ].
	^ {TypMethodLookup
			receiver: context super
			selector: aMessage selector
			arguments: aMessage arguments
			self: context self
			super: context super superOrNil}
]

{ #category : #initialization }
TypInfSuper >> transfer [
	self put: (context super ifNil: TypNilType instance)
]
