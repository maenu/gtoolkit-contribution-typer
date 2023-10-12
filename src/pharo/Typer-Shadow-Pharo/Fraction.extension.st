Extension { #name : #Fraction }

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ super typShaMethodBinaryEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreaterOrEqual: aLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodUnaryNegated: aLookup [
	<typShaMethod: 'negated'>
	^ super typShaMethodUnaryNegated: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodUnaryReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ super typShaMethodUnaryReciprocal: aLookup
]
