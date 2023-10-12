Extension { #name : #ScaledDecimal }

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodUnaryNegated: aLookup [
	<typShaMethod: 'negated'>
	^ super typShaMethodUnaryNegated: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodUnaryReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ super typShaMethodUnaryReciprocal: aLookup
]
