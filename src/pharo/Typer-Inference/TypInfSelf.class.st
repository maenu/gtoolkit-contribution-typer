Class {
	#name : #TypInfSelf,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfSelf class >> value [

	<typPraResult: 'TypType'>
	^ super value ifNil: [ 
		  Halt once.
		  TypUnknownType new ]
]
