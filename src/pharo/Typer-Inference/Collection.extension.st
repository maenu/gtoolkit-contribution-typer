Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	^ type
		copyWithParameters: {(self typSelfTypeSamples collect: #typAsType) typAsType}
]

{ #category : #'*Typer-Inference' }
Collection >> typSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
