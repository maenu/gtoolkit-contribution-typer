Extension { #name : #IdentitySet }

{ #category : #'*Typer-Core' }
IdentitySet >> typAsType [

	<typPraResult: 'TypType'>
	| reduced |
	self ifEmpty: [ ^ TypUnknownType instance ].
	reduced := IdentitySet new.
	self do: [ :e | 
		e isUnion
			ifTrue: [ reduced addAll: e types ]
			ifFalse: [ reduced add: e ] ].
	reduced size = 1 ifTrue: [ ^ reduced anyOne ].
	^ TypUnionType types: reduced
]
