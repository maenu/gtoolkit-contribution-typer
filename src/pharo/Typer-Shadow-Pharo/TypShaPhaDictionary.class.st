Class {
	#name : #TypShaPhaDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaDictionary class >> shadowedClass [
	^ Dictionary class
]

{ #category : #shadow }
TypShaPhaDictionary >> mAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaDictionary >> mAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedDictionary typAsType
				copyWithParameters:
					{(aLookup receiver at: '@B').
					(aLookup receiver at: '@A')})
]

{ #category : #shadow }
TypShaPhaDictionary >> mAssociations: aLookup [
	<typShaMethod: 'associations'>
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
TypShaPhaDictionary >> mAssociationsDo: aLookup [
	<typShaMethod: 'associationsDo:'>
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
TypShaPhaDictionary >> mAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup receiver at: '@A').
			aLookup arguments second result} typAsType
		arguments:
			{(aLookup receiver at: '@B').
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{(aLookup receiver at: '@B').
			(BlockClosure
				typAsFunctionTypeWithResult: (aLookup receiver at: '@A'))}
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
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
TypShaPhaDictionary >> mAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{(aLookup receiver at: '@B').
			(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mBinary214: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup receiver
				copyWithParameters:
					{{(aLookup receiver at: '@B').
					((aLookup arguments at: 1) at: '@B')} typAsType.
					{(aLookup receiver at: '@A').
					((aLookup arguments at: 1) at: '@A')} typAsType})
		arguments: {Dictionary typAsType}
]

{ #category : #shadow }
TypShaPhaDictionary >> mCollect: aLookup [
	<typShaMethod: 'collect:'>
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
TypShaPhaDictionary >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mKeys: aLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@B')})
]

{ #category : #shadow }
TypShaPhaDictionary >> mKeysAndValuesDo: aLookup [
	<typShaMethod: 'keysAndValuesDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(aLookup receiver at: '@B').
					(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaDictionary >> mRemoveKeyIfAbsent: aLookup [
	<typShaMethod: 'removeKey:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{(aLookup receiver at: '@A').
			aLookup arguments first result} typAsType
		arguments:
			{(aLookup receiver at: '@B').
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaDictionary >> mValues: aLookup [
	<typShaMethod: 'values'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})
]

{ #category : #accessing }
TypShaPhaDictionary >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters:
			{('@B' -> '@B' typAsVariableType).
			('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
