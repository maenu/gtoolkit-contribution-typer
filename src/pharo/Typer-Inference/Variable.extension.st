Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	TypInfNodeStack actives size
		<= (TypInfCurrentConfiguration value maxNodeStackSize / 2)
		ifFalse: [ ^ TypUnknownType instance ].
	^ ((aType writers: self) sorted: [ :a :b | a size < b size ])
		ifEmpty: [ TypUnknownType instance ]
		ifNotEmpty: [ :c | 
			(c
				typWithIndexFlatCollect: [ :m :i | 
					(i < TypInfCurrentConfiguration value maxWriters
						and: m size <= TypInfCurrentConfiguration value maxMethodSize)
						ifTrue: [ m variableNodes
								select: [ :n | n variable == self and: [ n isWrite ] ]
								thenCollect: [ :n | 
									(TypInfContextLookup
										node: m ast
										arguments: m selector typInfUnknownArguments
										self: aType
										super: anotherType) result typeAt: n ] ]
						ifFalse: [ {TypUnknownType instance} ] ]) typAsMinimizedType ]
]
