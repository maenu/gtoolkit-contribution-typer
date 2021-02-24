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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithParameters:
					{('@B' typAsVariableType resolveIn: a receiver).
					('@A' typAsVariableType resolveIn: a receiver)} ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mAssociations: aLookup [ 
	<typShaMethod: 'associations'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithParameters:
					{(Association typAsType
						copyWithParameters:
							{('@B' typAsVariableType resolveIn: a receiver).
							('@A' typAsVariableType resolveIn: a receiver)})} ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mAssociationsDo: aLookup [
	<typShaMethod: 'associationsDo:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(Association typAsType
						copyWithParameters:
							{('@B' typAsVariableType resolveIn: a receiver).
							('@A' typAsVariableType resolveIn: a receiver)})} ];
		resultType: [ :a :s | a receiver ];
		yourself
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
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiver ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
		resultType: [ :a | 
			{('@A' typAsVariableType resolveIn: a receiver).
			a argumentTypes second result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiver ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: ('@A' typAsVariableType resolveIn: a receiver) ] ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiver ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{('@B' typAsVariableType resolveIn: a receiver).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiver)}
				argumentsOptional: true
				signalsAlways: false).
			(BlockClosure typAsFunctionTypeWithResult: TypUnknownType new)}
				at: i ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Dictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiver
				copyWithParameters:
					{{('@B' typAsVariableType resolveIn: a receiver).
					('@B' typAsVariableType resolveIn: (a argumentTypes at: 1))}
						typAsType.
					{('@A' typAsVariableType resolveIn: a receiver).
					('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))}
						typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mCollect: aLookup [ 
	<typShaMethod: 'collect:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiver)})} typAsType ];
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
										receiverType: ('@A' typAsVariableType resolveIn: a receiver);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiver
				copyWithParameters:
					{('@B' typAsVariableType resolveIn: a receiver).
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{('@B' typAsVariableType resolveIn: a receiver).
					('@A' typAsVariableType resolveIn: a receiver)} ];
		resultType: [ :a :s :r | a receiver ];
		yourself
]

{ #category : #shadow }
TypShaPhaDictionary >> mRemoveKeyIfAbsent: aLookup [
	<typShaMethod: 'removeKey:ifAbsent:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i == 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiver ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsVariableType resolveIn: a receiver).
			a argumentTypes first result} typAsType ];
		yourself
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
