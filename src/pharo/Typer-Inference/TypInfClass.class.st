Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfClass >> transfer [
	| lookup type |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ type := self previous.
			state
				at: node variable put: type;
				at: self put: type.
			^ self ].
	lookup := TypVariableLookup
			receiver: node variable owningClass typAsType
			selector: node variable name.
	type := (lookup resolver isKindOf: TypInfVariableResolver)
			ifTrue: [ node variable typInfAssignedTypeSelf: context self super: context super ]
			ifFalse: [ lookup resultOrUnknown ].
	state at: node variable covariantPut: (state at: self covariantPut: type)
]
