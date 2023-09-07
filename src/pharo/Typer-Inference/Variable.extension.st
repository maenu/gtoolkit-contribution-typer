Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedType: aState self: aType super: anotherType [
	^ ((self typInfWritesSelf: aType super: anotherType)
		collect: [ :n | aState at: n ifAbsent: [ aState at: n put: n type ] ])
		typAsMinimizedType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType [
	^ ((self typInfWritesSelf: aType super: aType superOrNil)
		collect: #type) typAsMinimizedType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfWritesSelf: aType super: anotherType [
	^ (TypInfMethodIndex instance writers: self)
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | 
					n variable == self
						and: [ n isWrite and: [ n methodNode compiledMethod methodClass typAsType >= aType ] ] ]
				thenFlatCollect: [ :e | 
					TypInfMethodResolver instance
						nodesAt: e value
						self: aType
						super: anotherType ] ]
]
