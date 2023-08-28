Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfClass >> transfer [
	| receiver |
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ self put: (state at: node variable) ].
	receiver := node variable owningClass typAsType.
	self
		put: ((receiver
				preResolveVariable: (TypVariableLookup
						receiver: receiver
						selector: node variable name asSymbol
						parent: nil))
				detect: [ :l | l resolver isKindOf: TypInfVariableResolver ]
				ifFound: [ :l | 
					receiver classDescription instanceSide allClassVariables
						detect: [ :e | e name = node variable name asSymbol ]
						ifFound: [ :v | v typInfTypeSelf: context self ]
						ifNone: [ Error signal: 'should not happen' ] ]
				ifNone: [ receiver lookupVariable: node variable name asSymbol ])
]
