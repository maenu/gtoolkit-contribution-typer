Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLocalDefinition >> outgoingReads [

	^ outgoing
		  at: #read
		  ifPresent: [ :e | e collect: #target ]
		  ifAbsent: [ #(  ) ]
]

{ #category : #accessing }
TypInfLocalDefinition >> transfer [

	state
		at: self
		put: (self outgoingReads collect: [ :n | n state at: n ]) typAsType
]
