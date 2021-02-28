Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typInfIsFromSharedPool [
	^ (self scope isKindOf: OCClassScope) and: [ self isFromSharedPool ] 
]

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typInfSharedPool [
	<typTypeResultAs: 'ClassDescription'>
	self assert: [ self typInfIsFromSharedPool ].
	^ (self scope "typCastAs OCClassScope") getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: self assoc key ]
]
