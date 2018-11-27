Extension { #name : #RBComment }

{ #category : #'*Typer' }
RBComment >> typIsParameters [
	^ contents beginsWith: 'typParameters '
]

{ #category : #'*Typer' }
RBComment >> typParameters [
	self assert: [ self typIsParameters ].
	^ ($, split: (contents copyFrom: 'typParameters ' size + 1 to: contents size)) collect: #typAsType
]