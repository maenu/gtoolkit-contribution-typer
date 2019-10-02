Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| types |
	types := TypUnionType asTypes: self.
	types ifEmpty: [ ^ TypUnknownType instance ].
	types size = 1
		ifTrue: [ ^ types anyOne ].
	^ TypUnionType new
		types: types;
		yourself
]

{ #category : #'*Typer-Core' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type bindings size = 1 ])
		ifTrue: [ type := type copy.
			type bindings
				at: type bindings keys first
				put:
					(self typSelfTypeSamples collect: [ :e | e class typAsType ])
						typAsType ].
	^ type
]

{ #category : #'*Typer-Core' }
Collection >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self ]
]
