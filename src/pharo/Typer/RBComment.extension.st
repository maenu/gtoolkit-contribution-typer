Extension { #name : #RBComment }

{ #category : #'*Typer' }
RBComment >> typCastAs [
	self assert: [ self typIsCastAs ].
	^ (contents copyFrom: 'typCastAs ' size + 1 to: contents size) typAsType
]

{ #category : #'*Typer' }
RBComment >> typIsCastAs [
	^ contents beginsWith: 'typCastAs '
]

{ #category : #'*Typer' }
RBComment >> typIsParameters [
	^ contents beginsWith: 'typParameters '
]

{ #category : #'*Typer' }
RBComment >> typParameters [
	self assert: [ self typIsParameters ].
	^ (contents copyFrom: 'typParameters ' size + 1 to: contents size) typAsTypes
]
