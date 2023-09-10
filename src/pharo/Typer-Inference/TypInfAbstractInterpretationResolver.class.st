Class {
	#name : #TypInfAbstractInterpretationResolver,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfAbstractInterpretationResolver class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypInfAbstractInterpretationResolver class >> invalidate [
	instance := nil
]
