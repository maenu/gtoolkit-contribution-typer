Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodCursorPositionDo: aLookup [
	<typShaMethod: 'cursorPositionDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Integer typAsType}}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder class >> typShaMethodForMethod: aLookup [
	<typShaMethod: 'forMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodSave: aLookup [
	<typShaMethod: 'save'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaVariableAstCache: aLookup [
	<typShaVariable: #astCache>
	^ Association typAsType
		withParameters: {String typAsType.
				RBMethodNode typAsType}
]
