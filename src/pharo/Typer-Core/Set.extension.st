Extension { #name : #Set }

{ #category : #'*Typer-Core' }
Set >> typAsType [
	<typPraResult: 'TypType'>
	| flattened |
	self ifEmpty: [ ^ TypUnknownType instance ].
	flattened := Set new.
	self
		do: [ :e | e isUnion ifTrue: [ flattened addAll: e types ] ifFalse: [ flattened add: e ] ].
	flattened size = 1 ifTrue: [ ^ flattened anyOne ].
	^ TypUnionType types: flattened
]
