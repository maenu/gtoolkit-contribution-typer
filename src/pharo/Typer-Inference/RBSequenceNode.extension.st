Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursiveSelf: aType [

	statements ifEmpty: [ ^ self typInfNilSelf: aType ].
	^ (statements collect: [ :e | e typInfTypeSelf: aType ]) last
]
