Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodKeywordAddInstVarNamed: aLookup [
	<typShaMethod: 'addInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodKeywordHasInstVarNamed: aLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryClassSide: aLookup [
	<typShaMethod: 'classSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryInstanceSide: aLookup [
	<typShaMethod: 'instanceSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryIsClassSide: aLookup [
	<typShaMethod: 'isClassSide'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryIsTestCase: aLookup [
	<typShaMethod: 'isTestCase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
