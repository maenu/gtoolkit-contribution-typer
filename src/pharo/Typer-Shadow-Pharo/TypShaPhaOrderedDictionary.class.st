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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedDictionary typAsType
				copyWithParameters:
					{(aLookup receiver at: '@B').
					(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAssociations: aLookup [
	<typShaMethod: 'associations'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Array typAsType
				copyWithParameters:
					{(Association typAsType
						copyWithParameters:
							{(aLookup receiver at: '@B').
							(aLookup receiver at: '@A')})})
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAssociationsDo: aLookup [
	<typShaMethod: 'associationsDo:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(Association typAsType
						copyWithParameters:
							{(aLookup receiver at: '@B').
							(aLookup receiver at: '@A')})})}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAt: aLookup [
	<typShaMethod: 'at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{(aLookup receiver at: '@B').
			(BlockClosure
				typAsFunctionTypeWithResult: (aLookup receiver at: '@A'))}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup arguments at: 2) result.
			(aLookup arguments at: 3) result} typAsType
		arguments:
			{(aLookup receiver at: '@B').
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')}
				argumentsOptional: true
				signalsAlways: false).
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{(aLookup receiver at: '@B').
			(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mBinary276: aLookup [
	<typShaMethod: ','>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver
				copyWithParameters:
					{{(aLookup receiver at: '@B').
					((aLookup arguments at: 1) at: '@B')} typAsType.
					{(aLookup receiver at: '@A').
					((aLookup arguments at: 1) at: '@A')} typAsType})
		arguments: {OrderedDictionary typAsType}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mCollect: aLookup [
	<typShaMethod: 'collect:'>
	<typMigrated>
	| a r |
	a := aLookup arguments at: 1.
	r := (a hasValue and: [ a value isString ])
		ifTrue: [ ((aLookup receiver at: '@A')
				lookupMethod: a value asSymbol
				arguments: #()) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup root receiver
				copyWithParameters:
					{(aLookup receiver at: '@B').
					r})
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaOrderedDictionary >> mKeys: aLookup [
	<typShaMethod: 'keys'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Array typAsType copyWithParameters: {(aLookup receiver at: '@B')})
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters:
			{('@B' -> '@B' typAsVariableType).
			('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
