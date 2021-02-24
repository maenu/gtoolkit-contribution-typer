Class {
	#name : #TypShaPhaBlockClosure,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure class >> shadowedClass [
	^ BlockClosure class
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCull: aLookup [ 
	<typShaMethod: 'cull:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCull: aLookup [ 
	<typShaMethod: 'cull:cull:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCull: aLookup [ 
	<typShaMethod: 'cull:cull:cull:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCullCull: aLookup [ 
	<typShaMethod: 'cull:cull:cull:cull:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mEnsure: aLookup [ 
	<typShaMethod: 'ensure:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mOnDo: aLookup [ 
	<typShaMethod: 'on:do:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Exception class typAsType ]
				ifFalse: [ | first type |
					first := a argumentTypes at: 1.
					type := (first isNamed and: [ first hasClassDescription ])
						ifTrue: [ first classDescription instanceSide typAsType ]
						ifFalse: [ Exception class typAsType ].
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {type}
						argumentsOptional: true
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{a receiverType result.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValue: aLookup [ 
	<typShaMethod: 'value:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValue: aLookup [ 
	<typShaMethod: 'value:value:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValue: aLookup [ 
	<typShaMethod: 'value:value:value:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValueValue: aLookup [ 
	<typShaMethod: 'value:value:value:value:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileFalse: aLookup [
	<typShaMethod: 'whileFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileTrue: aLookup [
	<typShaMethod: 'whileTrue:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypNilType new
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: #()
				argumentsOptional: false
				signalsAlways: false)}
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> resolveType: aLookup [
	^ aLookup classDescription
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
