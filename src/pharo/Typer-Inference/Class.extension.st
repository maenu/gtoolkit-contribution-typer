Extension { #name : #Class }

{ #category : #'*Typer-Inference' }
Class >> typInfAsVariableLookupResultFor: aSymbol [
	^ aSymbol first isUppercase
		ifTrue: [ (self classVarNames includes: aSymbol)
				ifTrue: [ | type |
					type := self
						typInfVariableAssignedTypeFor: aSymbol
						in: self allMethods , self class allMethods.
					TypVariableLookupResult new
						type: [ type ];
						yourself ] ]
		ifFalse: [ (self allInstVarNames includes: aSymbol)
				ifTrue: [ | type |
					type := self
						typInfVariableAssignedTypeFor: aSymbol
						in: self allMethods.
					TypVariableLookupResult new
						type: [ type ];
						yourself ] ]
]
