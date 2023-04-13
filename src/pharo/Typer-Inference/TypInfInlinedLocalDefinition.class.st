Class {
	#name : #TypInfInlinedLocalDefinition,
	#superclass : #TypInfLocalDefinition,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedLocalDefinition class >> node: aNode proxy: anObject [

	^ (self node: aNode)
		  incomingArguments: { anObject };
		  yourself
]

{ #category : #accessing }
TypInfInlinedLocalDefinition >> transfer [

	state covariant: self with: (state at: self incomingArguments first)
]
