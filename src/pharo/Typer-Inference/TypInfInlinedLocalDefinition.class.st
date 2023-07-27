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
	state at: self put: (state at: self inArguments first)
]

{ #category : #accessing }
TypInfInlinedLocalDefinition >> type [
	^ state at: self
]
