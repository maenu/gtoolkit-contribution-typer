Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeSelf: aType super: anotherType [
	| writers |
	writers := TypInfIndex instance writers: self.
	writers size > TypInfManifest maxWriters
		ifTrue: [ ^ TypUnknownType instance	"too many potentially new method inferences, accounts for 95% of instance vars" ].
	^ (writers
		flatCollect: [ :m | 
			m variableNodes
				select: [ :n | n variable == self and: [ n isWrite and: [ m methodClass typAsType >= aType ] ] ]
				thenFlatCollect: [ :n | 
					| lookup |
					lookup := m typInfAsLookupSelf: aType super: anotherType.
					TypInfIndex instance
						context: lookup
						ifPresent: [ :c | (c nodesAt: n) collect: #type ]
						ifAbsent: [ (TypInfNodeStack canPush: n methodNode)
								ifTrue: [ ((TypInfIndex instance context: m) nodesAt: n) collect: #type ]
								ifFalse: [ {TypUnknownType instance} ] ] ] ]) typAsMinimizedType
]
