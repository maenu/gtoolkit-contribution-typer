Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaCollection class >> mWith: aLookup [
	<typShaMethod: 'with:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver classDescription instanceSide typAsType
				copyWithParameters: {(aLookup arguments at: 1)})
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithAll: aLookup [
	<typShaMethod: 'withAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver classDescription instanceSide typAsType
				copyWithParameters: {((aLookup arguments at: 1) at: '@A')})
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithWith: aLookup [
	<typShaMethod: 'with:with:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver classDescription instanceSide typAsType
				copyWithParameters: {aLookup arguments typAsType})
		arguments:
			{TypUnknownType new.
			TypUnknownType new}
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #shadow }
TypShaPhaCollection >> mAdd: aLookup [
	<typShaMethod: 'add:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mAddAll: aLookup [
	<typShaMethod: 'addAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mAllSatisfy: aLookup [
	<typShaMethod: 'allSatisfy:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaCollection >> mAnySatisfy: aLookup [
	<typShaMethod: 'anySatisfy:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mAsDictionary: aLookup [
	<typShaMethod: 'asDictionary'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Dictionary typAsType
				copyWithParameters:
					{((aLookup receiver at: '@A') at: '@A').
					((aLookup receiver at: '@A') at: '@B')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsIdentitySet: aLookup [
	<typShaMethod: 'asIdentitySet'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(IdentitySet typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedCollection: aLookup [
	<typShaMethod: 'asOrderedCollection'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedDictionary typAsType
				copyWithParameters:
					{((aLookup receiver at: '@A') at: '@A').
					((aLookup receiver at: '@A') at: '@B')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsSet: aLookup [
	<typShaMethod: 'asSet'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Set typAsType copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mBinary170: aLookup [
	<typShaMethod: ','>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup root receiver copy
				at: '@A'
					put:
					{(aLookup receiver at: '@A').
					((aLookup arguments at: 1) at: '@A')} typAsType;
				yourself)
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mCollect: aLookup [
	<typShaMethod: 'collect:'>
	^ TypFunctionType new
		argumentTypes:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType};
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ ((aLookup receiver at: '@A')
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result ]
						ifFalse: [ TypUnknownType new ] ].
			aLookup receiver copyWithParameters: {elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithout: aLookup [
	<typShaMethod: 'copyWithout:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithoutAll: aLookup [
	<typShaMethod: 'copyWithoutAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetect: aLookup [
	<typShaMethod: 'detect:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfFound: aLookup [
	<typShaMethod: 'detect:ifFound:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfFoundIfNone: aLookup [
	<typShaMethod: 'detect:ifFound:ifNone:'>
	^ TypFunctionType new
		argumentTypes:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')}
				argumentsOptional: true
				signalsAlways: false)} typAsType.
			BlockClosure typAsType};
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 2.
			argumentNode := aLookup argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ ((aLookup receiver at: '@A')
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result ]
						ifFalse: [ TypUnknownType new ] ].
			{elementType.
			(aLookup arguments at: 3) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfNone: aLookup [
	<typShaMethod: 'detect:ifNone:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup receiver at: '@A').
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDo: aLookup [
	<typShaMethod: 'do:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mFlatCollect: aLookup [
	<typShaMethod: 'flatCollect:'>
	^ TypFunctionType new
		argumentTypes:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType};
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ argumentType result at: '@A' ]
						ifFalse: [ TypUnknownType new ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ ((aLookup receiver at: '@A')
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result at: '@A' ]
						ifFalse: [ TypUnknownType new ] ].
			aLookup receiver copyWithParameters: {elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mGroupedBy: aLookup [
	<typShaMethod: 'groupedBy:'>
	^ TypFunctionType new
		argumentTypes: [ {Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ ((aLookup receiver at: '@A')
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result ]
						ifFalse: [ '@B' typAsVariableType ] ].
			OrderedDictionary typAsType
				copyWithParameters:
					{keyType.
					(Collection typAsType
						copyWithParameters: {(aLookup receiver at: '@A')})} ];
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiver.
			(aLookup arguments at: 1) result} typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mIfEmptyIfNotEmpty: aLookup [
	<typShaMethod: 'ifEmpty:ifNotEmpty:'>
	^ TypFunctionType new
		argumentTypes:
			{BlockClosure typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup receiver}
				argumentsOptional: true
				signalsAlways: false)} typAsType};
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 2.
			argumentNode := aLookup argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ (aLookup receiver
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result ]
						ifFalse: [ TypUnknownType new ] ].
			{(aLookup arguments at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIfNotEmpty: aLookup [
	<typShaMethod: 'ifNotEmpty:'>
	^ TypFunctionType new
		argumentTypes: [ {Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup receiver}
				argumentsOptional: true
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ (aLookup receiver
								lookupMethod: argumentNode value asSymbol
								arguments: #()) result ]
						ifFalse: [ TypUnknownType new ] ].
			{aLookup receiver.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludesAll: aLookup [
	<typShaMethod: 'includesAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mInjectInto: aLookup [
	<typShaMethod: 'inject:into:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup arguments at: 1).
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{(aLookup arguments at: 1).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(aLookup arguments at: 1).
					(aLookup receiver at: '@A')})}
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{{(aLookup receiver at: '@A').
					(aLookup arguments at: 1) result} typAsType.
					(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mReject: aLookup [
	<typShaMethod: 'reject:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mRemove: aLookup [
	<typShaMethod: 'remove:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mRemoveIfAbsent: aLookup [
	<typShaMethod: 'remove:ifAbsent:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup arguments at: 1).
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{(aLookup receiver at: '@A').
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mSelect: aLookup [
	<typShaMethod: 'select:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})} typAsType}
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
