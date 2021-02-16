Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| types |
	types := TypUnionType asTypes: self.
	types ifEmpty: [ ^ TypUnknownType new ].
	types size = 1
		ifTrue: [ ^ types anyOne ].
	^ TypUnionType types: types
]
