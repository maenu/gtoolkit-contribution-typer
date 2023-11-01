Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodKeywordAddInstVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'addInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodKeywordHasInstVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryClassSide: aLookup root: anotherLookup [
	<typShaMethod: 'classSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryInstanceSide: aLookup root: anotherLookup [
	<typShaMethod: 'instanceSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryIsClassSide: aLookup root: anotherLookup [
	<typShaMethod: 'isClassSide'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodUnaryIsTestCase: aLookup root: anotherLookup [
	<typShaMethod: 'isTestCase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
