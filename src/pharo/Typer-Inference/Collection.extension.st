Extension { #name : 'Collection' }

{ #category : '*Typer-Inference' }
Collection >> typInfSelfType [

	^ self class typAsType copyWithParameters:
		  { (self typInfSelfTypeSamples collect: #typInfSelfType) typAsType }
]

{ #category : '*Typer-Inference' }
Collection >> typInfSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self copy asOrderedCollection.
	^ 128 typTimesCollect: [ pool remove: pool atRandom ]
]
