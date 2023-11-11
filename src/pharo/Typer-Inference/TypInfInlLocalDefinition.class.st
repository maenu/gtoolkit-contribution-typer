Class {
	#name : #TypInfInlLocalDefinition,
	#superclass : #TypInfLocalDefinition,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlLocalDefinition class >> node: aNode context: aContext proxy: anObject [
	^ (self node: aNode context: aContext)
		inArguments: {anObject};
		yourself
]

{ #category : #accessing }
TypInfInlLocalDefinition >> constrainTo: aType from: aNode [
	super constrainTo: aType from: aNode.
	(self inArgumentAt: 1) constrainTo: aType from: aNode
]

{ #category : #accessing }
TypInfInlLocalDefinition >> transfer [
	state
		at: self
		put: (state
				at: (self inArgumentAt: 1)
				ifAbsent: [ TypUnknownType instance	"undefined" ])
]

{ #category : #accessing }
TypInfInlLocalDefinition >> type [
	^ state at: self ifAbsent: [ TypUnknownType instance ]
]
