Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodAddInstVarNamed: aLookup [
	<typShaMethod: 'addInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodClassSide: aLookup [
	<typShaMethod: 'classSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodHasInstVarNamed: aLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodInstanceSide: aLookup [
	<typShaMethod: 'instanceSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodIsClassSide: aLookup [
	<typShaMethod: 'isClassSide'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ClassDescription >> typShaMethodIsTestCase: aLookup [
	<typShaMethod: 'isTestCase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
