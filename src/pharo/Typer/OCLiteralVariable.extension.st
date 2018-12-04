Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer' }
OCLiteralVariable >> typIsFromSharedPool [
	^ (scope respondsTo: #getClass) and: self isFromSharedPool
]

{ #category : #'*Typer' }
OCLiteralVariable >> typSharedPool [
	self assert: [ self typIsFromSharedPool ].
	^ scope getClass instanceSide sharedPools detect: [ :pool | pool classVarNames includes: assoc key ]
]
