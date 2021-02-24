Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaSequenceableCollection class >> mOfSize: aLookup [ 
	<typShaMethod: 'ofSize:'>
	
	^ TypFunctionType new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAtIfAbsent: aLookup [ 
	<typShaMethod: 'at:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mBeginsWith: aLookup [
	<typShaMethod: 'beginsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiverType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mCopyFromTo: aLookup [
	<typShaMethod: 'copyFrom:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mDetectIndex: aLookup [ 
	<typShaMethod: 'detectIndex:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mDetectIndexIfNone: aLookup [ 
	<typShaMethod: 'detectIndex:ifNone:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						argumentsOptional: false
						signalsAlways: false ]
				ifFalse: [ {TypUnknownType new.
					(BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {}
						argumentsOptional: false
						signalsAlways: false)} typAsType ] ];
		resultType: [ :a | 
			| none |
			none := a argumentTypes at: 2.
			{Integer typAsType.
			((none hasClassDescription
				and: [ none classDescription == BlockClosure ])
				ifTrue: [ none result ]
				ifFalse: [ none ])} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mEndsWith: aLookup [ 
	<typShaMethod: 'endsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiverType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mFirst: aLookup [
	<typShaMethod: 'first'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIndexOf: aLookup [
	<typShaMethod: 'indexOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {(aLookup receiverType at: '@A')}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mLast: aLookup [
	<typShaMethod: 'last'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mReversed: aLookup [
	<typShaMethod: 'reversed'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mSort: aLookup [ 
	<typShaMethod: 'sort:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			| type |
			type := a receiverType isParametric
				ifTrue: [ '@A' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ TypUnknownType new ].
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{type.
					type}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexCollect: aLookup [ 
	<typShaMethod: 'withIndexCollect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType:
				[ :a :s :r | a receiverType copyWithParameters: {(a argumentTypes at: 1) result} ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexDo: aLookup [ 
	<typShaMethod: 'withIndexDo:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexSelect: aLookup [ 
	<typShaMethod: 'withIndexSelect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
