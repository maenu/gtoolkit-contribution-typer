Class {
	#name : #TypInfInlinedLocalDefinition,
	#superclass : #TypInfLocalDefinition,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedLocalDefinition class >> node: aNode context: aContext proxy: anObject [
	^ (self node: aNode context: aContext)
		inArguments: {anObject};
		yourself
]

{ #category : #accessing }
TypInfInlinedLocalDefinition >> transfer [
	self flag: 'TODO should use state at: arg, but arg type is more concrete'.
	state at: self put: (self inArgumentAt: 1) type
]
