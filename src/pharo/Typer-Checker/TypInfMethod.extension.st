Extension { #name : #TypInfMethod }

{ #category : #'*Typer-Checker' }
TypInfMethod >> typCheOn: aStream [
	| lookup expected actual |
	lookup := self lookup.
	expected := lookup result.
	in
		at: #return
		ifPresent: [ :s | 
			s
				do: [ :e | 
					actual := e origin type.
					expected >= actual
						ifFalse: [ aStream
								nextPut: (TypCheIncompatible
										node: e origin
										lookup: lookup
										expected: expected) ].
					(expected isNullable not and: actual isNullable)
						ifTrue: [ aStream
								nextPut: (TypCheNullable
										node: e origin
										lookup: lookup
										message: 'return is nullable') ] ] ]
]
