Extension { #name : #IdentitySet }

{ #category : #'*Typer-Core' }
IdentitySet >> typAsType [

	<typPraResult: 'TypType'>
	| flattened |
	self ifEmpty: [ ^ TypUnknownType instance ].
	flattened := IdentitySet new.
	self do: [ :e | 
		e isUnion
			ifTrue: [ flattened addAll: e types ]
			ifFalse: [ flattened add: e ] ].
	flattened size = 1 ifTrue: [ ^ flattened anyOne ].
	^ TypUnionType types: flattened
]
