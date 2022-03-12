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

	(state at: self) isUnknown ifFalse: [ ^ self ].
	state at: self put: TypNilType instance
]

{ #category : #accessing }
TypInfLocalDefinition >> type [

	| type |
	type := super type.
	type isUnknown ifFalse: [ ^ type ].
	^ (self outgoingReads collect: #type) typAsType
]
