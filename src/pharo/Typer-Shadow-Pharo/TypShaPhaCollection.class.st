Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaCollection class >> mWith: aLookup [ 
	<typShaMethod: 'with:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign: (a argumentTypes at: 1)
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithAll: aLookup [ 
	<typShaMethod: 'withAll:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign: ('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithWith: aLookup [ 
	<typShaMethod: 'with:with:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign:
					{(a argumentTypes at: 1).
					(a argumentTypes at: 2)} typAsType
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #shadow }
TypShaPhaCollection >> mAdd: aLookup [ 
	<typShaMethod: 'add:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAddAll: aLookup [ 
	<typShaMethod: 'addAll:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' typAsVariableType resolveIn: a receiverType)} ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAllSatisfy: aLookup [ 
	<typShaMethod: 'allSatisfy:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
]

{ #category : #shadow }
TypShaPhaCollection >> mAnySatisfy: aLookup [ 
	<typShaMethod: 'anySatisfy:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAsDictionary: aLookup [ 
	<typShaMethod: 'asDictionary'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsVariableType resolveIn: a receiverType.
			type := Dictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithParameters:
							{('@A' typAsVariableType resolveIn: elementType).
							('@B' typAsVariableType resolveIn: elementType)} ].
			type ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAsIdentitySet: aLookup [
	<typShaMethod: 'asIdentitySet'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(IdentitySet typAsType
				copyWithParameters: {(aLookup receiverType at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedCollection: aLookup [
	<typShaMethod: 'asOrderedCollection'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {(aLookup receiverType at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedDictionary: aLookup [ 
	<typShaMethod: 'asOrderedDictionary'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsVariableType resolveIn: a receiverType.
			type := OrderedDictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithParameters:
							{('@A' typAsVariableType resolveIn: elementType).
							('@B' typAsVariableType resolveIn: elementType)} ].
			type ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mAsSet: aLookup [
	<typShaMethod: 'asSet'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Set typAsType copyWithParameters: {(aLookup receiverType at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mBinary170: aLookup [ 
	<typShaMethod: ','>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| result |
			result := a receiverType copy.
			'@A' typAsType
				assign:
					{('@A' typAsVariableType resolveIn: a receiverType).
					('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))}
						typAsType
				in: result.
			result ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mCollect: aLookup [ 
	<typShaMethod: 'collect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
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
			a receiverType copyWithParameters: {elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithout: aLookup [
	<typShaMethod: 'copyWithout:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {(aLookup receiverType at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithoutAll: aLookup [
	<typShaMethod: 'copyWithoutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetect: aLookup [ 
	<typShaMethod: 'detect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfFound: aLookup [
	<typShaMethod: 'detect:ifFound:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiverType at: '@A')}
				argumentsOptional: false
				signalsAlways: false)} typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiverType at: '@A')}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfFoundIfNone: aLookup [ 
	<typShaMethod: 'detect:ifFound:ifNone:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						argumentsOptional: false
						signalsAlways: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {Symbol typAsType.
							(BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
								argumentsOptional: true
								signalsAlways: false)} typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {}
								argumentsOptional: false
								signalsAlways: false ] ] ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
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
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfNone: aLookup [ 
	<typShaMethod: 'detect:ifNone:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						argumentsOptional: false
						signalsAlways: false)} typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mDo: aLookup [
	<typShaMethod: 'do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiverType at: '@A')}
				argumentsOptional: false
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mFlatCollect: aLookup [ 
	<typShaMethod: 'flatCollect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ '@A' typAsVariableType resolveIn: argumentType result ]
						ifFalse: [ TypUnknownType new ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ '@A' typAsVariableType
								resolveIn:
									(TypMethodLookupIndex instance
										resultTypeFor:
											(TypMethodLookup new
												receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
												selector: argumentNode value asSymbol;
												argumentTypes: {};
												argumentNodes: {};
												yourself)) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiverType copyWithParameters: {elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mGroupedBy: aLookup [ 
	<typShaMethod: 'groupedBy:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ '@B' typAsVariableType ] ].
			OrderedDictionary typAsType
				copyWithParameters:
					{keyType.
					(Collection typAsType
						copyWithParameters: {('@A' typAsVariableType resolveIn: a receiverType)})} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mGtItemsFor: aLookup [
	<typShaMethod: 'gtItemsFor:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowView typAsType
		arguments: {GtPhlowView typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mIfEmpty: aLookup [ 
	<typShaMethod: 'ifEmpty:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIfEmptyIfNotEmpty: aLookup [ 
	<typShaMethod: 'ifEmpty:ifNotEmpty:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {a receiverType}
						argumentsOptional: true
						signalsAlways: false)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{(a argumentTypes at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIfNotEmpty: aLookup [ 
	<typShaMethod: 'ifNotEmpty:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {a receiverType}
				argumentsOptional: true
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{a receiverType.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiverType at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludesAll: aLookup [
	<typShaMethod: 'includesAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiverType at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mInjectInto: aLookup [ 
	<typShaMethod: 'inject:into:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments:
							{(a argumentTypes at: 1).
							('@A' typAsVariableType resolveIn: a receiverType)}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mIsNotEmpty: aLookup [
	<typShaMethod: 'isNotEmpty'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mMax: aLookup [
	<typShaMethod: 'max'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mReduce: aLookup [ 
	<typShaMethod: 'reduce:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{{('@A' typAsVariableType resolveIn: a receiverType).
					(a argumentTypes at: 1) result} typAsType.
					('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mReject: aLookup [
	<typShaMethod: 'reject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiverType at: '@A')}
				argumentsOptional: false
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mRemove: aLookup [
	<typShaMethod: 'remove:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {(aLookup receiverType at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mRemoveIfAbsent: aLookup [ 
	<typShaMethod: 'remove:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ '@A' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mSelect: aLookup [
	<typShaMethod: 'select:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiverType at: '@A')}
				argumentsOptional: false
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mSize: aLookup [
	<typShaMethod: 'size'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #accessing }
TypShaPhaCollection >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
