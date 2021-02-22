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
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mCursorPositionDo: aLookup [ 
	<typShaMethod: 'cursorPositionDo:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewCompletionStrategy: aLookup [
	<typShaMethod: 'newCompletionStrategy'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionStrategy typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewSourceStyler: aLookup [
	<typShaMethod: 'newSourceStyler'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCoderTextStyler typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mRbAST: aLookup [
	<typShaMethod: 'rbAST'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSave: aLookup [
	<typShaMethod: 'save'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mUpdateMethod: aLookup [
	<typShaMethod: 'updateMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {CompiledMethod typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder >> vAstCache: aLookup [
	<typShaForVariable: #astCache>
	^ Association typAsType
		copyWithParameters:
			{String typAsType.
			RBMethodNode typAsType}
]
