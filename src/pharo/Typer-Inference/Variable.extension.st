Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	| writers |
	writers := TypInfIndex instance writers: self.
	writers size > 8
		ifTrue: [  "too many potentially new method inferences"^ TypUnknownType instance ].
	^ (writers
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenFlatCollect: [ :e | 
					[ (TypInfMethodResolver instance
						nodesAt: e value
						self: aType
						super: anotherType) collect: #type ]
						on: Error
						do: [ {TypUnknownType instance} ] ] ]) typAsMinimizedType
]
