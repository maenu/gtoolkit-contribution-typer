Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> transfer [
	| lookup |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ self put: (state at: node variable) ].
	lookup := TypVariableLookup receiver: context self selector: node variable name.
	self
		covariantPut: ((lookup resolver isKindOf: TypInfVariableResolver)
				ifTrue: [ node variable typInfAssignedTypeSelf: context self super: context super ]
				ifFalse: [ lookup resultOrUnknown ])
]
