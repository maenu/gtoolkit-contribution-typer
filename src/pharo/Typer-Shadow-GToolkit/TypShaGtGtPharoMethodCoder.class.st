Class {
	#name : #TypShaGtGtPharoMethodCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtPharoMethodCoder class >> mForMethod: aLookup [
	<typShaMethod: 'forMethod:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mCursorPositionDo: aLookup [

	<typShaMethod: 'cursorPositionDo:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: aLookup root receiver
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { Integer typAsType }) }
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mSave: aLookup [
	<typShaMethod: 'save'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaGtGtPharoMethodCoder >> mUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {CompiledMethod typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoMethodCoder >> vAstCache: aLookup [
	<typShaVariable: #astCache>
	^ Association typAsType
		withParameters:
			{String typAsType.
			RBMethodNode typAsType}
]
