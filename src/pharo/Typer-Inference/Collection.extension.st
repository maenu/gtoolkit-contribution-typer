Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typInfSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 typTimesCollect: [ pool remove: pool atRandom ]
]

{ #category : #'*Typer-Inference' }
Collection >> typInfType [

	^ self class typAsType copyWithParameters:
		  { (self typInfSelfTypeSamples collect: #typInfType) typAsType }
]
