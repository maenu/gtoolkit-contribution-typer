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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAssert: aLookup [
	<typShaMethod: 'assert:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mBinary248: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Object typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mBinary255: aLookup [
	<typShaMethod: '~='>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
]

{ #category : #shadow }
TypShaPhaObject >> mHash: aLookup [
	<typShaMethod: 'hash'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mInstVarNamed: aLookup [
	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mIsKindOf: aLookup [
	<typShaMethod: 'isKindOf:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments:
			{Symbol typAsType.
			SequenceableCollection typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mPrintOn: aLookup [
	<typShaMethod: 'printOn:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {(Stream typAsType copyWithParameters: {Character typAsType})}
]

{ #category : #shadow }
TypShaPhaObject >> mPrintString: aLookup [
	<typShaMethod: 'printString'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mYourself: aLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
]
