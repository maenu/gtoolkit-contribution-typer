Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typIsFromSharedPool [
	^ (self scope isKindOf: OCClassScope) and: [ self isFromSharedPool ] 
]

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typSharedPool [
	<typTypeResultAs: 'ClassDescription'>
	self assert: [ self typIsFromSharedPool ].
	^ (self scope "typCastAs OCClassScope") getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: self assoc key ]
]
