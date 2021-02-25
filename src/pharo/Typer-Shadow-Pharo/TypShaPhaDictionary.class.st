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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaDictionary >> mAsOrderedDictionary: aLookup [
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
TypShaPhaDictionary >> mAssociations: aLookup [
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
TypShaPhaDictionary >> mAssociationsDo: aLookup [
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
TypShaPhaDictionary >> mAt: aLookup [
	<typShaMethod: 'at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	<typMigrated>
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
	<typMigrated>
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
TypShaPhaDictionary >> mAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{(aLookup receiver at: '@B').
			(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mBinary214: aLookup [
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
		arguments: {Dictionary typAsType}
]

{ #category : #shadow }
TypShaPhaDictionary >> mCollect: aLookup [
	<typShaMethod: 'collect:'>
	^ TypFunctionType new
		argumentTypes: [ {Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {(aLookup receiver at: '@A')})} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: String)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (aLookup receiver at: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			aLookup receiver
				copyWithParameters:
					{(aLookup receiver at: '@B').
					elementType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mIncludes: aLookup [
	<typShaMethod: 'includes:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {(aLookup receiver at: '@B')}
]

{ #category : #shadow }
TypShaPhaDictionary >> mKeys: aLookup [
	<typShaMethod: 'keys'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@B')})
]

{ #category : #shadow }
TypShaPhaDictionary >> mKeysAndValuesDo: aLookup [
	<typShaMethod: 'keysAndValuesDo:'>
	<typMigrated>
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
	<typMigrated>
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
	<typMigrated>
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
