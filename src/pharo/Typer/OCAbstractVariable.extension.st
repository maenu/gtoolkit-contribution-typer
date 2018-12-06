Extension { #name : #OCAbstractVariable }

{ #category : #'*Typer' }
OCAbstractVariable >> typIsFromSharedPool [
	<typTypeResultAs: 'Boolean'>
	^ (self isKindOf: OCLiteralVariable) and: [ (self scope isKindOf: OCClassScope) and: [ self isFromSharedPool ] ]
]
