Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> transfer [
	| lookup type |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ type := self previous.
			state
				at: node variable put: type;
				at: self put: type.
			^ self ].
	lookup := TypVariableLookup receiver: context self selector: node variable name.
	type := (lookup resolver isKindOf: TypInfVariableResolver)
			ifTrue: [ node variable typInfAssignedTypeSelf: context self super: context super ]
			ifFalse: [ lookup resultOrUnknown ].
	state at: node variable covariantPut: (state at: self covariantPut: type)
]
