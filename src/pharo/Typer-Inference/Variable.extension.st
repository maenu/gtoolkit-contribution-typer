Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeIn: aContext [
	| types |
	types := aContext node variableNodes
			select: [ :n | n variable == self and: [ n isWrite ] ]
			thenCollect: [ :n | aContext typeAt: n ].
	TypInfNodeStack actives size
		<= (TypInfCurrentConfiguration value maxNodeStackSize / 2)
		ifFalse: [ ^ types ifEmpty: TypUnknownType instance ifNotEmpty: #typAsMinimizedType ].
	^ types
		, ((((aContext self writers: self)
				reject: [ :m | m compiledMethod ast == aContext node ])
				sorted: [ :a :b | a size < b size ])
				typWithIndexFlatCollect: [ :m :i | 
					(i < TypInfCurrentConfiguration value maxWriters
						and: m size <= TypInfCurrentConfiguration value maxMethodSize)
						ifTrue: [ m variableNodes
								select: [ :n | n variable == self and: [ n isWrite ] ]
								thenCollect: [ :n | 
									(TypMethodLookup
										receiver: m methodClass typAsType
										selector: m selector
										arguments: m selector typInfUnknownArguments
										self: aContext self
										super: aContext super) context
										ifNil: [ TypUnknownType instance ]
										ifNotNil: [ :cc | cc typeAt: n ] ] ]
						ifFalse: [ {TypUnknownType instance} ] ])
		ifEmpty: TypUnknownType instance
		ifNotEmpty: #typAsMinimizedType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	TypInfNodeStack actives size
		<= (TypInfCurrentConfiguration value maxNodeStackSize / 2)
		ifFalse: [ ^ TypUnknownType instance ].
	^ (((aType writers: self) sorted: [ :a :b | a size < b size ])
		typWithIndexFlatCollect: [ :m :i | 
			(i < TypInfCurrentConfiguration value maxWriters
				and: m size <= TypInfCurrentConfiguration value maxMethodSize)
				ifTrue: [ m variableNodes
						select: [ :n | n variable == self and: [ n isWrite ] ]
						thenCollect: [ :n | 
							(TypMethodLookup
								receiver: m methodClass typAsType
								selector: m selector
								arguments: m selector typInfUnknownArguments
								self: aType
								super: anotherType) context
								ifNil: [ TypUnknownType instance ]
								ifNotNil: [ :cc | cc typeAt: n ] ] ]
				ifFalse: [ {TypUnknownType instance} ] ])
		ifEmpty: TypUnknownType instance
		ifNotEmpty: #typAsMinimizedType
]
