Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	^ (((TypInfMethodIndex instance writers: self)
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenFlatCollect: [ :e | 
					TypInfMethodResolver instance
						nodesAt: e value
						self: aType
						super: anotherType ] ]) collect: #type) typAsMinimizedType
]
