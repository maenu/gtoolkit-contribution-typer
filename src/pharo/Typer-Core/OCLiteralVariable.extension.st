Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Core' }
OCLiteralVariable >> typIsFromSharedPool [
	^ (self scope isKindOf: OCClassScope) and: [ self isFromSharedPool ] 
]

{ #category : #'*Typer-Core' }
OCLiteralVariable >> typSharedPool [
	<typTypeResultAs: 'ClassDescription'>
	self assert: [ self typIsFromSharedPool ].
	^ (self scope "typCastAs OCClassScope") getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: self assoc key ]
]
