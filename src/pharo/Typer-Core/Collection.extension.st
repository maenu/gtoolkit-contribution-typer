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

{ #category : #'*Typer-Core' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	^ type
		copyWithParameters:
			{((type parameters keys at: 1)
				-> (self typSelfTypeSamples collect: #typAsType) typAsType)}
				asOrderedDictionary
]

{ #category : #'*Typer-Core' }
Collection >> typSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
