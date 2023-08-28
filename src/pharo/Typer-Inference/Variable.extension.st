Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfTypeSelf: aType [
	^ ((TypInfMethodIndex instance writers: self)
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenCollect: [ :e | e value typInfTypeSelf: aType ] ]) typAsType
		asNullable
]
