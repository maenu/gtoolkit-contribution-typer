Extension { #name : #Dictionary }

{ #category : #'*Typer-Inference' }
Dictionary >> typInfSelfType [

	| b a |
	b := OrderedCollection new.
	a := OrderedCollection new.
	self typInfSelfTypeSamples collect: #typInfSelfType thenDo: [ :e | 
		b add: (e at: '@B').
		a add: (e at: '@A') ].
	^ self class typAsType copyWithParameters: { 
			  b typAsType.
			  a typAsType }
]

{ #category : #'*Typer-Inference' }
Dictionary >> typInfSelfTypeSamples [

	| pool |
	self size < 128 ifTrue: [ ^ self associations ].
	pool := self associations copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
