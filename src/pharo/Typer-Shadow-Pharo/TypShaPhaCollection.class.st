Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaCollection class >> mWith: aLookup [
	<typShaMethod: 'with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver classDescription instanceSide typAsType
				copyWithParameters: {(aLookup arguments at: 1)})
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithAll: aLookup [
	<typShaMethod: 'withAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver classDescription instanceSide typAsType
				copyWithParameters: {((aLookup arguments at: 1) at: '@A')})
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection class >> mWithWith: aLookup [
	<typShaMethod: 'with:with:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mAddAll: aLookup [
	<typShaMethod: 'addAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mAllSatisfy: aLookup [
	<typShaMethod: 'allSatisfy:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaCollection >> mAnySatisfy: aLookup [
	<typShaMethod: 'anySatisfy:'>
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
	^ CompiledMethod typAsFunctionTypeWithResult:
		  (Dictionary typAsType copyWithParameters: { 
				   ((aLookup receiver at: '@A') at: '@A').
				   ((aLookup receiver at: '@A') at: '@B') })
]

{ #category : #shadow }
TypShaPhaCollection >> mAsIdentitySet: aLookup [
	<typShaMethod: 'asIdentitySet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(IdentitySet typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedCollection: aLookup [
	<typShaMethod: 'asOrderedCollection'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAsOrderedDictionary: aLookup [

	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod typAsFunctionTypeWithResult:
		  (OrderedDictionary typAsType copyWithParameters: { 
				   ((aLookup receiver at: '@A') at: '@A').
				   ((aLookup receiver at: '@A') at: '@B') })
]

{ #category : #shadow }
TypShaPhaCollection >> mAsSet: aLookup [
	<typShaMethod: 'asSet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mBinary170: aLookup [

	<typShaMethod: ','>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: (aLookup root receiver
				   copyWithAt: '@A' put: { 
						   (aLookup receiver at: '@A').
						   ((aLookup arguments at: 1) at: '@A') } typAsType;
				   yourself)
		  arguments: { Collection typAsType }
]

{ #category : #shadow }
TypShaPhaCollection >> mCollect: aLookup [
	<typShaMethod: 'collect:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		ifTrue: [ ((aLookup root receiver at: '@A')
				lookupMethod: a value asSymbol
				arguments: #()) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup root receiver copyWithParameters: {r})
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup root receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithout: aLookup [
	<typShaMethod: 'copyWithout:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mCopyWithoutAll: aLookup [
	<typShaMethod: 'copyWithoutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Collection typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetect: aLookup [
	<typShaMethod: 'detect:'>
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
	| a r |
	a := aLookup arguments at: 2.
	r := (a isValue and: [ a value isString ])
		ifTrue: [ ((aLookup receiver at: '@A')
				lookupMethod: a value asSymbol
				arguments: #()) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{r.
			(aLookup arguments at: 3) result} typAsType
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
				signalsAlways: false)} typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mDetectIfNone: aLookup [
	<typShaMethod: 'detect:ifNone:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup root receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mFlatCollect: aLookup [
	<typShaMethod: 'flatCollect:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		ifTrue: [ ((aLookup receiver at: '@A')
				lookupMethod: a value asSymbol
				arguments: #()) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup root receiver copyWithParameters: {(r at: '@A')})
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mGroupedBy: aLookup [
	<typShaMethod: 'groupedBy:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		ifTrue: [ ((aLookup receiver at: '@A')
				lookupMethod: a value asSymbol
				arguments: #()) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedDictionary typAsType
				copyWithParameters:
					{r.
					(Collection typAsType
						copyWithParameters: {(aLookup receiver at: '@A')})})
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mGtItemsFor: aLookup [
	<typShaMethod: 'gtItemsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowView typAsType
		arguments: {GtPhlowView typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mIfEmpty: aLookup [
	<typShaMethod: 'ifEmpty:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup root receiver.
			(aLookup arguments at: 1) result} typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mIfEmptyIfNotEmpty: aLookup [

	<typShaMethod: 'ifEmpty:ifNotEmpty:'>
	<typPraArguments: 'TypMethodLookup'>
	<typPraResult: 'TypFunctionType'>
	| a r |
	a := aLookup arguments at: 2.
	r := (a isValue and: [ a value isString ])
		     ifTrue: [ 
			     (aLookup root receiver
				      lookupMethod: a value asSymbol
				      arguments: #(  )) result ]
		     ifFalse: [ a result ].
	^ CompiledMethod
		  typAsFunctionTypeWithResult: { 
				  (aLookup arguments at: 1) result.
				  r } typAsType
		  arguments: { 
				  BlockClosure typAsType.
				  { 
					  Symbol typAsType.
					  (BlockClosure
						   typAsFunctionTypeWithResult: TypUnknownType new
						   arguments: { aLookup root receiver }
						   argumentsOptional: true
						   signalsAlways: false) } typAsType }
]

{ #category : #shadow }
TypShaPhaCollection >> mIfNotEmpty: aLookup [
	<typShaMethod: 'ifNotEmpty:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		ifTrue:
			[ (aLookup root receiver lookupMethod: a value asSymbol arguments: #())
				result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup root receiver.
			r} typAsType
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup root receiver}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mIncludesAll: aLookup [
	<typShaMethod: 'includesAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaCollection >> mInjectInto: aLookup [
	<typShaMethod: 'inject:into:'>
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
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mIsNotEmpty: aLookup [
	<typShaMethod: 'isNotEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mMax: aLookup [
	<typShaMethod: 'max'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #shadow }
TypShaPhaCollection >> mReduce: aLookup [
	<typShaMethod: 'reduce:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaCollection >> mRemoveIfAbsent: aLookup [
	<typShaMethod: 'remove:ifAbsent:'>
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
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #accessing }
TypShaPhaCollection >> resolveType: aLookup [
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
