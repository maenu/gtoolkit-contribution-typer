Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignmentNodesIn: aType [
	^ (TypInfMethodIndex instance writers: self)
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenCollect: #parent ]
]
