Extension { #name : #TypInfMethod }

{ #category : #'*Typer-Checker' }
TypInfMethod >> typCheMethod [
	^ TypCheIndex instance resolveMethod: self lookup
]
