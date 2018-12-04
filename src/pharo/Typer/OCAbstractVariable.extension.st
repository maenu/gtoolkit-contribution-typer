Extension { #name : #OCAbstractVariable }

{ #category : #'*Typer' }
OCAbstractVariable >> typIsFromSharedPool [
	^ (self isKindOf: OCLiteralVariable) and: [ (scope respondsTo: #getClass) and: [ self isFromSharedPool ] ]
]
