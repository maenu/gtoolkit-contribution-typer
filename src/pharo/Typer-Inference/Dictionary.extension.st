Extension { #name : #Dictionary }

{ #category : #'*Typer-Inference' }
Dictionary >> typInfType [

	| b a |
	b := OrderedCollection new.
	a := OrderedCollection new.
	self typInfTypes do: [ :e | 
		b add: (e at: '@B').
		a add: (e at: '@A') ].
	^ self class typAsType copyWithParameters: { 
			  b typAsType.
			  a typAsType }
]

{ #category : #'*Typer-Inference' }
Dictionary >> typInfTypes [

	self size < 128 ifTrue: [ 
		^ self associations collect: #typInfType as: Array ].
	^ 128 typTimesCollect: [ :e | self atRandom typInfType ]
]
