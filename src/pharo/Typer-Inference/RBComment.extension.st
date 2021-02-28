Extension { #name : #RBComment }

{ #category : #'*Typer-Inference' }
RBComment >> typInfType: aType [
	(contents beginsWith: 'typCastAs ')
		ifTrue: [ ^ (contents copyFrom: 'typCastAs ' size + 1 to: contents size)
				typAsType ].
	(contents beginsWith: 'typParameters ')
		ifTrue: [ ^ aType
				copyWithParameters:
					(contents copyFrom: 'typParameters ' size + 1 to: contents size)
						typAsTypes ].
	^ aType
]
