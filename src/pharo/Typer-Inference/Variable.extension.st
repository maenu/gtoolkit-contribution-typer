Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	TypInfNodeStack actives size <= (TypInfIndex instance maxNodeStackSize / 2)
		ifFalse: [ ^ TypUnknownType instance ].
	^ ((aType writers: self) sorted: [ :a :b | a size < b size ])
		ifEmpty: [ TypUnknownType instance ]
		ifNotEmpty: [ :c | 
			(c
				typWithIndexFlatCollect: [ :m :i | 
					(i < TypInfIndex instance maxWriters
						and: m size <= TypInfIndex instance maxMethodSize)
						ifTrue: [ m variableNodes
								select: [ :n | n variable == self and: [ n isWrite ] ]
								thenCollect: [ :n | 
									TypInfIndex instance
										contextAt: (m typInfAsLookupWithSelf: aType super: anotherType)
										ifNew: #run
										ifPresent: [ :cc | cc typeAt: n ]
										ifAbsent: [ TypUnknownType instance ] ] ]
						ifFalse: [ {TypUnknownType instance} ] ]) typAsMinimizedType ]
]
