Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer' }
OCLiteralVariable >> typSharedPool [
	<typTypeResultAs: 'ClassDescription'>
	self assert: [ self typIsFromSharedPool ].
	^ scope getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: assoc key ]
]
