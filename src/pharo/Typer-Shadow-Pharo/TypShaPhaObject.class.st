Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #shadow }
TypShaPhaObject >> mAsString: aLookup [
	<typShaMethod: 'asString'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mAssert: aLookup [
	<typShaMethod: 'assert:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mBinary248: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Object typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mBinary255: aLookup [ 
	<typShaMethod: '~='>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mBinary256: aLookup [ 
	<typShaMethod: '->'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | a argumentTypes at: 1 ];
		resultType: [ :a :s :r | 
			Association typAsType
				copyWithParameters:
					{a receiverType.
					(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mCopy: aLookup [
	<typShaMethod: 'copy'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mHash: aLookup [
	<typShaMethod: 'hash'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mInstVarNamed: aLookup [
	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mIsKindOf: aLookup [ 
	<typShaMethod: 'isKindOf:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | {ClassDescription typAsType} at: i ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mPerform: aLookup [ 
	<typShaMethod: 'perform:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | 
			| argument |
			argument := a argumentNodes at: 1.
			(argument isLiteralNode and: [ argument value isSymbol ])
				ifTrue: [ TypMethodLookupIndex instance
						resultTypeFor:
							(TypMethodLookup new
								receiverType: a receiverType;
								selector: argument value;
								argumentTypes: #();
								argumentNodes: #();
								yourself) ]
				ifFalse: [ TypUnknownType new ] ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mPerformWithEnoughArguments: aLookup [ 
	<typShaMethod: 'perform:withEnoughArguments:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ SequenceableCollection typAsType ] ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mPrintOn: aLookup [ 
	<typShaMethod: 'printOn:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Stream typAsType copyWithParameters: {Character typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaObject >> mPrintString: aLookup [
	<typShaMethod: 'printString'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaObject >> mYourself: aLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
