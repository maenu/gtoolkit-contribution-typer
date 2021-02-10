Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| types |
	types := TypUnionType asTypes: (self "typParameters TypType").
	types ifEmpty: [ ^ TypUnknownType instance ].
	types size = 1
		ifTrue: [ ^ types anyOne ].
	^ TypUnionType types: types
]

{ #category : #'*Typer-Core' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithParameters:
					{((type parameters at: 1)
						->
							(self typSelfTypeSamples collect: [ :e | e class typAsType ])
								typAsType)} asDictionary ].
	^ type
]

{ #category : #'*Typer-Core' }
Collection >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self asOrderedCollection ]
]
