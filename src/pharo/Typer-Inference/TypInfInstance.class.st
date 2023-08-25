Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> transfer [
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ state at: self put: (state at: node variable) ].
	self
		covariantPut: ((context self
				preResolveVariable: (TypVariableLookup
						receiver: context self
						selector: node variable name asSymbol
						parent: nil))
				detect: [ :l | l resolver isKindOf: TypInfVariableResolver ]
				ifFound: [ :l | 
					l receiver classDescription
						slotNamed: l selector
						ifFound: [ :v | 
							((v typInfAssignmentNodesIn: l receiver)
								collect: [ :e | e value typInfTypeSelf: context self ]) typAsType ]
						ifNone: [ Error signal: 'should not happen' ] ]
				ifNone: [ context self lookupVariable: node variable name asSymbol ])
]
