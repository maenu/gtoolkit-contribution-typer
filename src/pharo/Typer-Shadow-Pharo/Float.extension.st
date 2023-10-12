Extension { #name : #Float }

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodKeywordBasicAt: aLookup [
	<typShaMethod: 'basicAt:'>
	^ super typShaMethodKeywordBasicAt: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodKeywordBasicAtPut: aLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodUnaryAbs: aLookup [
	<typShaMethod: 'abs'>
	^ super typShaMethodUnaryAbs: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodUnaryNegated: aLookup [
	<typShaMethod: 'negated'>
	^ super typShaMethodUnaryNegated: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodUnaryReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ super typShaMethodUnaryReciprocal: aLookup
]
