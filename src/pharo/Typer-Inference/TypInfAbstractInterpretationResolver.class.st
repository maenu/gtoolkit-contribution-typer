Class {
	#name : #TypInfAbstractInterpretationResolver,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfAbstractInterpretationResolver class >> instance [
	^ instance ifNil: [ instance := self new ]
]
