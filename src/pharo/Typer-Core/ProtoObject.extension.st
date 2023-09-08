Extension { #name : #ProtoObject }

{ #category : #'*Typer-Core' }
ProtoObject >> typNuke [
	1 to: self class instSize do: [ :i | self instVarAt: i put: nil ]
]
