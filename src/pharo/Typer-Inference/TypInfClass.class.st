Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfClass >> transfer [
	| lookup |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ self put: (state at: node variable) ].
	lookup := TypVariableLookup
			receiver: node variable owningClass typAsType
			selector: node variable name.
	self
		covariantPut: ((lookup resolve resolver isKindOf: TypInfVariableResolver)
				ifTrue: [ node variable typInfAssignedTypeSelf: context self super: context super ]
				ifFalse: [ lookup resultOrUnknown ])
]
