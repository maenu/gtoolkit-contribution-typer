Extension { #name : #Fraction }

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetBinary1: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetBinary2: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetBinary3: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetBinary4: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Fraction typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMetReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
