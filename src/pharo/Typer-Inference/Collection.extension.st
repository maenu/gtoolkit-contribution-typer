Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	^ type
		copyWithParameters:
			{((type parameters keys at: 1)
				-> (self typSelfTypeSamples collect: #typAsType) typAsType)}
				asOrderedDictionary
]

{ #category : #'*Typer-Inference' }
Collection >> typSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
