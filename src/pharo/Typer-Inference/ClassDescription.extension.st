Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAsClassDescriptionLookupResult [
	^ TypClassDescriptionLookupResult new
		type: [ :a | a classDescription typAsNamedType ];
		yourself
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAsMethodLookupResultFor: aSymbol [
	^ self methodDict
		at: aSymbol
		ifPresent: #typInfAsMethodLookupResult
		ifAbsent: [ nil ]
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfVariableAssignedTypeFor: aSymbol in: aCollection [
	^ (aCollection
		flatCollect: [ :f | 
			| types |
			types := (f assignmentNodes
				select: [ :h | h variable name = aSymbol ])
				collect: [ :h | h value typType ].
			types
				ifNotEmpty:
					[ f ast typTypeReset	"reset type, as it might impact other resolvers" ].
			types ]) typAsType
]
