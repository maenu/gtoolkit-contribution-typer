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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderMethodElement typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mCompiledMethod: aLookup [ 
	<typShaMethod: 'compiledMethod'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCompletionStrategy typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mNewSourceStyler: aLookup [ 
	<typShaMethod: 'newSourceStyler'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderTextStyler typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mRbAST: aLookup [ 
	<typShaMethod: 'rbAST'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSave: aLookup [ 
	<typShaMethod: 'save'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mSelector: aLookup [ 
	<typShaMethod: 'selector'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoder >> mUpdateMethod: aLookup [ 
	<typShaMethod: 'updateMethod:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder >> vAstCache: aLookup [
	<typShaForVariable: #astCache>
	^ Association typAsType
		copyWithParameters:
			{String typAsType.
			RBMethodNode typAsType}
]
