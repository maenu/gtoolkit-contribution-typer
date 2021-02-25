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
		resultType: [ :a | a receiver classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup receiver at: '@A').
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{Integer typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mBeginsWith: aLookup [
	<typShaMethod: 'beginsWith:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mCopyFromTo: aLookup [
	<typShaMethod: 'copyFrom:to:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mDetectIndex: aLookup [
	<typShaMethod: 'detectIndex:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mDetectIndexIfNone: aLookup [
	<typShaMethod: 'detectIndex:ifNone:'>
	^ TypFunctionType new
		argumentTypes:
			{(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {(aLookup receiver at: '@A')}).
			{TypUnknownType new.
			(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
				typAsType};
		resultType: [ :a | 
			| none |
			none := aLookup arguments at: 2.
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mFirst: aLookup [
	<typShaMethod: 'first'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIndexOf: aLookup [
	<typShaMethod: 'indexOf:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mLast: aLookup [
	<typShaMethod: 'last'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mReversed: aLookup [
	<typShaMethod: 'reversed'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mSort: aLookup [
	<typShaMethod: 'sort:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{(aLookup receiver at: '@A').
					(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexCollect: aLookup [
	<typShaMethod: 'withIndexCollect:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver
				copyWithParameters: {(aLookup arguments at: 1) result})
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(aLookup receiver at: '@A').
					Integer typAsType})}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexDo: aLookup [
	<typShaMethod: 'withIndexDo:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(aLookup receiver at: '@A').
					Integer typAsType})}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexSelect: aLookup [
	<typShaMethod: 'withIndexSelect:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{(aLookup receiver at: '@A').
					Integer typAsType})}
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
