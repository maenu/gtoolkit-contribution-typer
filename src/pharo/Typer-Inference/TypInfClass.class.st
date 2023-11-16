Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfClass >> covariantPut: aType [
	^ state at: node variable put: (super covariantPut: aType)
]

{ #category : #accessing }
TypInfClass >> put: aType [
	^ state at: node variable put: (super put: aType)
]

{ #category : #accessing }
TypInfClass >> slurp [
	super slurp.
	state at: self ifPresent: [ :t | state at: node variable covariantPut: t ]
]

{ #category : #accessing }
TypInfClass >> transfer [
	| lookup type |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ self put: self previous.
			^ self ].
	lookup := TypVariableLookup
			receiver: node variable owningClass typAsType
			selector: node variable name.
	type := (lookup resolver isKindOf: TypInfVariableResolver)
			ifTrue: [ node variable typInfAssignedTypeSelf: context self super: context super ]
			ifFalse: [ lookup resultOrUnknown ].
	self covariantPut: type
]
