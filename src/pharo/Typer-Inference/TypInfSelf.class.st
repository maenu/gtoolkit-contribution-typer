Class {
	#name : #TypInfSelf,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfSelf class >> value [ ^ super value ifNil: [Error signal:'TypInfSelf value must not be null, use #value:during:' ]
]
