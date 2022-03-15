Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfLocalDefinition >> constrainTo: aType [

	self outgoingReads do: [ :n | self constrain: n to: aType ]
]

{ #category : #initialization }
TypInfLocalDefinition >> initialize: aState [

	super initialize: aState.
	^ state at: self put: TypNilType instance
]

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

	^ (self outgoingReads collect: #type) typAsType
]
