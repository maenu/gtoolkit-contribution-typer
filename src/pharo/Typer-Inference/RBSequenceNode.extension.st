Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursiveIn: aContext [

	statements ifEmpty: [ ^ aContext nil: self ].
	^ (statements collect: [ :e | e typInfTypeIn: aContext ]) last
]
