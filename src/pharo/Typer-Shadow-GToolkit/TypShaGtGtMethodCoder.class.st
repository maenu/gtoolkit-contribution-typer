Class {
	#name : #TypShaGtGtMethodCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtMethodCoder class >> mForMethod: aLookup [
	<typShaMethod: 'forMethod:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {CompiledMethod typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder class >> shadowedClass [
	^ GtMethodCoder class
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType})}
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
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
