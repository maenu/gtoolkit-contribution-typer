Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder class >> typShaMethodKeywordForMethod: aLookup root: anotherLookup [
	<typShaMethod: 'forMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodKeywordUpdateMethod: aLookup root: anotherLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {CompiledMethod typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryCompiledMethod: aLookup root: anotherLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryNewCompletionStrategy: aLookup root: anotherLookup [
	<typShaMethod: 'newCompletionStrategy'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnaryRbAST: aLookup root: anotherLookup [
	<typShaMethod: 'rbAST'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnarySave: aLookup root: anotherLookup [
	<typShaMethod: 'save'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaMethodUnarySelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMethodCoder >> typShaVariableAstCache: aLookup root: anotherLookup [
	<typShaVariable: #astCache>
	^ Association typAsType
		withParameters: {String typAsType.
				RBMethodNode typAsType}
]
