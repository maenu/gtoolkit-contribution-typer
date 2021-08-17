Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typInfSelfType [

	^ (self class typAsType copyWithValue: self) copyWithParameters:
		  { (self typInfSelfTypeSamples collect: #typInfSelfType) typAsType }
]

{ #category : #'*Typer-Inference' }
Collection >> typInfSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
