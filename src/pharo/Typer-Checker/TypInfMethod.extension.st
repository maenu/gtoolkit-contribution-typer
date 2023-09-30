Extension { #name : #TypInfMethod }

{ #category : #'*Typer-Checker' }
TypInfMethod >> typChe [
	| expected actual |
	super typChe.
	expected := (TypMethodIndex instance resolveMethod: self lookup) result.
	in
		at: #return
		ifPresent: [ :s | 
			s
				do: [ :e | 
					actual := e origin type.
					expected >= actual
						ifFalse: [ TypCheIncompatible signal: e origin expected: expected ].
					(expected isNullable not and: actual isNullable)
						ifTrue: [ TypCheNullable signal: e origin ] ] ]
]
