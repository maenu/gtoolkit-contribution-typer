Extension { #name : #TypInfMethod }

{ #category : #'*Typer-Checker' }
TypInfMethod >> typCheOn: aStream [
	| expected actual |
	expected := (TypMethodIndex instance resolve: self lookup) result.
	in
		at: #return
		ifPresent: [ :s | 
			s
				do: [ :e | 
					actual := e origin type.
					expected >= actual
						ifFalse: [ aStream nextPut: (TypCheIncompatible node: e origin expected: expected) ].
					(expected isNullable not and: actual isNullable)
						ifTrue: [ aStream nextPut: (TypCheNullable node: e origin message: 'return is nullable') ] ] ]
]
