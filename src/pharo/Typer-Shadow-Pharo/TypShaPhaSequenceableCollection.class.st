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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsVariableType resolveIn: a receiver).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiver)}];
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
						arguments: {('@A' typAsVariableType resolveIn: a receiver)} ]
				ifFalse: [ {TypUnknownType new.
					(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
						typAsType ] ];
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
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			| type |
			type := a receiver isParametric
				ifTrue: [ '@A' typAsVariableType resolveIn: a receiver ]
				ifFalse: [ TypUnknownType new ].
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{type.
					type} ];
		resultType: [ :a | a receiver ];
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
					{('@A' typAsVariableType resolveIn: a receiver).
					Integer typAsType} ];
		resultType:
				[ :a :s :r | a receiver copyWithParameters: {(a argumentTypes at: 1) result} ];
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
					{('@A' typAsVariableType resolveIn: a receiver).
					Integer typAsType} ];
		resultType: [ :a | a receiver ];
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
					{('@A' typAsVariableType resolveIn: a receiver).
					Integer typAsType} ];
		resultType: [ :a :s :r | a receiver ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
