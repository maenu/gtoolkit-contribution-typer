Extension { #name : #Dictionary }

{ #category : #'*Typer-Inference' }
Dictionary >> typInfSelfTypeSamples [

	| pool |
	self size < 128 ifTrue: [ ^ self associations ].
	pool := self associations copy asOrderedCollection.
	^ 128 typTimesCollect: [ :e | pool remove: pool atRandom ]
]

{ #category : #'*Typer-Inference' }
Dictionary >> typInfType [

	| b a |
	b := OrderedCollection new.
	a := OrderedCollection new.
	self typInfSelfTypeSamples collect: #typInfType thenDo: [ :e | 
		b add: (e at: '@B').
		a add: (e at: '@A') ].
	^ self class typAsType copyWithParameters: { 
			  b typAsType.
			  a typAsType }
]
