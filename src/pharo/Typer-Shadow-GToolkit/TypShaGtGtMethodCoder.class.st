Class {
	#name : #TypShaGtGtMethodCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtMethodCoder class >> mForMethod: aLookup [ 
	<typShaMethod: 'forMethod:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder class >> shadowedClass [
	^ GtMethodCoder class
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mAsElement: aLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCoderMethodElement typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mCursorPositionDo: aLookup [
	<typShaMethod: 'cursorPositionDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: false
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewSourceStyler: aLookup [
	<typShaMethod: 'newSourceStyler'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCoderTextStyler typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSave: aLookup [
	<typShaMethod: 'save'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {CompiledMethod typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder >> vAstCache: aLookup [
	<typShaForVariable: #astCache>
	^ Association typAsType
		copyWithParameters:
			{String typAsType.
			RBMethodNode typAsType}
]
