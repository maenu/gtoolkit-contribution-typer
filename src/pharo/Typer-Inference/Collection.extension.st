Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typInfSelfType [
	| type |
	type := super typInfSelfType.
	^ type
		copyWithParameters: {(self typInfSelfTypeSamples collect: #typAsType) typAsType}
]

{ #category : #'*Typer-Inference' }
Collection >> typInfSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
