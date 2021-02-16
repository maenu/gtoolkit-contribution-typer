Extension { #name : #RBComment }

{ #category : #'*Typer-Inference' }
RBComment >> typType: aType [
	(contents beginsWith: 'typCastAs ')
		ifTrue: [ ^ (contents copyFrom: 'typCastAs ' size + 1 to: contents size)
				typAsType ].
	(contents beginsWith: 'typParameters ')
		ifTrue: [ ^ aType
				copyWithParameters:
					(aType parameters keys
						with:
							(contents copyFrom: 'typParameters ' size + 1 to: contents size)
								typAsTypes
						collect: [ :f :g | f -> g ]) asOrderedDictionary ].
	^ aType
]
