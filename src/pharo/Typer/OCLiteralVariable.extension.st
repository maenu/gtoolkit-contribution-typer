Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer' }
OCLiteralVariable >> typSharedPool [
	<typTypeResultAs: 'ClassDescription'>
	self assert: [ self typIsFromSharedPool ].
	^ (self scope "typCastAs OCClassScope") getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: self assoc key ]
]
