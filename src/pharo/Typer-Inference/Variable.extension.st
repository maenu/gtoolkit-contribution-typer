Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	| writers |
	writers := TypInfIndex instance writers: self.
	writers size > 8
		ifTrue: [ ^ TypUnknownType instance	"too many potentially new method inferences, accounts for 95% of instance vars" ].
	^ (writers
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenFlatCollect: [ :n | 
					TypInfMethodResolver instance
						outAt: (TypInfContextKey
								node: n methodNode
								self: aType
								super: anotherType)
						ifPresent: [ :c | (c nodesAt: n) collect: #type ]
						ifAbsent: [ (TypInfNodeStack canPush: n methodNode)
								ifTrue: [ (TypInfMethodResolver instance
										nodesAt: n
										self: aType
										super: anotherType) collect: #type ]
								ifFalse: [ {TypUnknownType instance} ] ] ] ]) typAsMinimizedType
]
