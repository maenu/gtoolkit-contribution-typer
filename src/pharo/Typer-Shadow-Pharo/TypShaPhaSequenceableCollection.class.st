Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaSequenceableCollection class >> mOfSize: aLookup [
	<typShaMethod: 'ofSize:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mCopyFromTo: aLookup [

	<typShaMethod: 'copyFrom:to:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: aLookup root receiver
		  arguments: { 
				  Integer typAsType.
				  Integer typAsType }
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mDetectIndex: aLookup [
	<typShaMethod: 'detectIndex:'>
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
	| a |
	a := aLookup arguments at: 2.
	^ CompiledMethod
		  typAsFunctionTypeWithResult: { 
				  Integer typAsType.
				  (a isFunction
					   ifTrue: [ a result ]
					   ifFalse: [ a ]) } typAsType
		  arguments: { 
				  (BlockClosure
					   typAsFunctionTypeWithResult: Boolean typAsType
					   arguments: { (aLookup receiver at: '@A') }).
				  { 
					  TypUnknownType instance.
					  (BlockClosure typAsFunctionTypeWithResult: Boolean typAsType) }
					  typAsType }
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mEndsWith: aLookup [
	<typShaMethod: 'endsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mFirst: aLookup [
	<typShaMethod: 'first'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIndexOf: aLookup [
	<typShaMethod: 'indexOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mLast: aLookup [
	<typShaMethod: 'last'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mReversed: aLookup [
	<typShaMethod: 'reversed'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mSort: aLookup [
	<typShaMethod: 'sort:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
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
	^ CompiledMethod
		  typAsFunctionTypeWithResult:
			  (aLookup receiver withParameters:
				   { (aLookup arguments at: 1) result })
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { 
						   (aLookup receiver at: '@A').
						   Integer typAsType }) }
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexDo: aLookup [

	<typShaMethod: 'withIndexDo:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: aLookup root receiver
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { 
						   (aLookup receiver at: '@A').
						   Integer typAsType }) }
]

{ #category : #shadow }
TypShaPhaSequenceableCollection >> mWithIndexSelect: aLookup [
	<typShaMethod: 'withIndexSelect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{(aLookup receiver at: '@A').
					Integer typAsType})}
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> resolveType: aLookup [
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
