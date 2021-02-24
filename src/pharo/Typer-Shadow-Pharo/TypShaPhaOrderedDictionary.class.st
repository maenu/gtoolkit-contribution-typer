Class {
	#name : #TypShaPhaOrderedDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary class >> shadowedClass [
	^ OrderedDictionary class
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAsOrderedDictionary: aLookup [ 
	<typShaMethod: 'asOrderedDictionary'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithParameters:
					{('@B' typAsVariableType resolveIn: a receiverType).
					('@A' typAsVariableType resolveIn: a receiverType)} ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAssociations: aLookup [ 
	<typShaMethod: 'associations'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithParameters:
					{(Association typAsType
						copyWithParameters:
							{('@B' typAsVariableType resolveIn: a receiverType).
							('@A' typAsVariableType resolveIn: a receiverType)})} ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAssociationsDo: aLookup [ 
	<typShaMethod: 'associationsDo:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(Association typAsType
						copyWithParameters:
							{('@B' typAsVariableType resolveIn: a receiverType).
							('@A' typAsVariableType resolveIn: a receiverType)})}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {(aLookup receiverType at: '@B')}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtIfAbsentPut: aLookup [ 
	<typShaMethod: 'at:ifAbsentPut:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: ('@A' typAsVariableType resolveIn: a receiverType)
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtIfPresentIfAbsent: aLookup [ 
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: true
				signalsAlways: false).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments:
			{(aLookup receiverType at: '@B').
			(aLookup receiverType at: '@A')}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mBinary276: aLookup [ 
	<typShaMethod: ','>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | OrderedDictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithParameters:
					{{('@B' typAsVariableType resolveIn: a receiverType).
					('@B' typAsVariableType resolveIn: (a argumentTypes at: 1))}
						typAsType.
					{('@A' typAsVariableType resolveIn: a receiverType).
					('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))}
						typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mCollect: aLookup [ 
	<typShaMethod: 'collect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: String)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiverType
				copyWithParameters:
					{(a receiverType at: '@B').
					elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiverType at: '@A')}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiverType at: '@B')}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mKeys: aLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Array typAsType copyWithParameters: {(aLookup receiverType at: '@B')})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters:
			{('@B' -> '@B' typAsVariableType).
			('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
