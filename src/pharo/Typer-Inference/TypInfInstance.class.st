Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> covariantPut: aType [
	^ state at: node variable put: (super covariantPut: aType)
]

{ #category : #accessing }
TypInfInstance >> put: aType [
	^ state at: node variable put: (super put: aType)
]

{ #category : #accessing }
TypInfInstance >> slurp [
	super slurp.
	state at: self ifPresent: [ :t | state at: node variable covariantPut: t ]
]

{ #category : #accessing }
TypInfInstance >> transfer [
	| lookup type |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ self put: self previous.
			^ self ].
	lookup := TypVariableLookup receiver: context self selector: node variable name.
	type := (lookup resolver isKindOf: TypInfVariableResolver)
			ifTrue: [ node variable typInfAssignedTypeIn: context ]
			ifFalse: [ lookup resultOrUnknown ].
	self covariantPut: type
]
