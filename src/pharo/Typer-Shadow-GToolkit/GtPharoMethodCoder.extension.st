Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder class >> typShaMethodKeywordForMethod: aLookup [
	<typShaMethod: 'forMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodKeywordUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnarySave: aLookup [
	<typShaMethod: 'save'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaVariableAstCache: aLookup [
	<typShaVariable: #astCache>
	^ Association typAsType
		withParameters: {String typAsType.
				RBMethodNode typAsType}
]
