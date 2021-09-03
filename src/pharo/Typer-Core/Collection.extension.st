Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsType [

	<typPraResult: 'TypType'>
	self ifEmpty: [ ^ TypUnknownType new ].
	self size = 1 ifTrue: [ ^ self anyOne ].
	^ TypUnionType types: self asSet
]
