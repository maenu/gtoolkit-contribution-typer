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
		incomingArguments: {anObject};
		yourself
]

{ #category : #accessing }
TypInfInlinedLocalDefinition >> transfer [
	state at: self put: (state at: self incomingArguments first)
]
