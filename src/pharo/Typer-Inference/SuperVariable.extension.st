Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfTypeRecursiveIn: aNode self: aType [

	aType hasSuperType ifTrue: [ ^ aType superType ].
	self flag: 'TODO can this ever happen?'.
	Halt once.
	^ aNode typInfUnknownSelf: aType
]
