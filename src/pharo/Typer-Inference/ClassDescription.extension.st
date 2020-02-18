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
ClassDescription >> typInfVariableAssignedTypeFor: aSymbol nodeClass: aClass in: aCollection [
	^ (aCollection
		flatCollect: [ :f | 
			| types |
			self flag: 'TODO might this affect the ast typing in other stacks?'.
			types := (f assignmentNodes
				select: [ :h | h variable name = aSymbol and: [ h variable class = aClass ] ])
				collect: [ :h | h value typType ].
			types ]) typAsType
]
