Class {
	#name : #TypShaGtGtPharoMethodCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtPharoMethodCoder class >> mForMethod: aLookup [
	<typShaMethod: 'forMethod:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {CompiledMethod typAsType}
]

{ #category : #accessing }
TypShaGtGtPharoMethodCoder class >> shadowedClass [
	^ GtPharoMethodCoder class
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mCursorPositionDo: aLookup [
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
TypShaGtGtPharoMethodCoder >> mNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mSave: aLookup [
	<typShaMethod: 'save'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {CompiledMethod typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoMethodCoder >> vAstCache: aLookup [
	<typShaForVariable: #astCache>
	^ Association typAsType
		copyWithParameters:
			{String typAsType.
			RBMethodNode typAsType}
]
