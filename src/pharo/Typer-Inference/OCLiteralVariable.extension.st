Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typInfIsFromSharedPool [
	^ (self scope isKindOf: OCClassScope) and: [ self isFromSharedPool ] 
]

{ #category : #'*Typer-Inference' }
OCLiteralVariable >> typInfSharedPool [
	<typPraResult: 'ClassDescription'>
	self assert: [ self typInfIsFromSharedPool ].
	^ self scope getClass instanceSide sharedPools
		detect: [ :e | e classVarNames includes: self assoc key ]	"typCastAs OCClassScope"
]
