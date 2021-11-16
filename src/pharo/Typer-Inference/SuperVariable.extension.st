Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfTypeRecursiveIn: aNode [

	| type |
	type := TypInfSelf value.
	type hasSuperType ifTrue: [ ^ type superType ].
	^ aNode typInfUnknown
]
