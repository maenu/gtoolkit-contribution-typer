Extension { #name : 'Set' }

{ #category : '*Typer-Core' }
Set >> typAsType [

	<typPraResult: 'TypType'>
	| reduced |
	self ifEmpty: [ ^ TypUnknownType new ].
	reduced := Set new.
	self do: [ :e | 
		e isUnion
			ifTrue: [ reduced addAll: e types ]
			ifFalse: [ reduced add: e ] ].
	reduced size = 1 ifTrue: [ ^ reduced anyOne ].
	^ TypUnionType types: reduced
]
