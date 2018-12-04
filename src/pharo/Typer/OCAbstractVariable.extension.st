Extension { #name : #OCAbstractVariable }

{ #category : #'*Typer' }
OCAbstractVariable >> typIsFromSharedPool [
	<typTypeResultAs: 'Boolean'>
	^ (self isKindOf: OCLiteralVariable) and: [ (scope respondsTo: #getClass) and: [ self isFromSharedPool ] ]
]
