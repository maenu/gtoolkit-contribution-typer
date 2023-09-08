Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> transfer [
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ self put: (state at: node variable) ].
	self
		covariantPut: ((context self
				preResolveVariable: (TypVariableLookup
						receiver: context self
						selector: node variable name asSymbol
						parent: nil))
				detect: [ :l | l resolver isKindOf: TypInfVariableResolver ]
				ifFound: [ :l | 
					l receiver classDescription
						slotNamed: node variable name asSymbol
						ifFound: [ :v | 
							v
								typInfAssignedType: state
								self: context self
								super: context super ]
						ifNone: [ Error signal: 'should not happen' ] ]
				ifNone: [ context self lookupVariable: node variable name asSymbol ])
]
