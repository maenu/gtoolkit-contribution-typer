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
TypShaPhaOrderedDictionary >> mAssociations: aLookup [ 
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
TypShaPhaOrderedDictionary >> mAssociationsDo: aLookup [ 
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
TypShaPhaOrderedDictionary >> mAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{('@A' typAsVariableType resolveIn: a receiver).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiver)}
				argumentsOptional: true
				signalsAlways: false).
			(BlockClosure typAsFunctionTypeWithResult: TypUnknownType new)} ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | OrderedDictionary typAsType ];
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
TypShaPhaOrderedDictionary >> mCollect: aLookup [ 
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
					{(a receiver at: '@B').
					elementType} ];
		yourself
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
