Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign: (a argumentTypes at: 1)
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a with: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType new ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign:
					{(a argumentTypes at: 1).
					(a argumentTypes at: 2)} typAsType
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection class >> ___withAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsVariableType
				assign: ('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #accessing }
TypShaPhaCollection >> ___add: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___addAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))} asDictionary ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___allSatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___anySatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsVariableType resolveIn: a receiverType.
			type := Dictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithParameters:
							{('@B' -> ('@A' typAsVariableType resolveIn: elementType)).
							('@A' -> ('@B' typAsVariableType resolveIn: elementType))} asDictionary ].
			type ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asIdentitySet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			IdentitySet typAsType
				copyWithParameters: {('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asOrderedCollection [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				copyWithParameters: {('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsVariableType resolveIn: a receiverType.
			type := OrderedDictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithParameters:
							{('@B' -> ('@A' typAsVariableType resolveIn: elementType)).
							('@A' -> ('@B' typAsVariableType resolveIn: elementType))} asDictionary ].
			type ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asSet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Set typAsType
				copyWithParameters: {('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: TypUnknownType new
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiverType
				copyWithParameters: {('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithout: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithoutAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifFound: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						result: TypUnknownType new
						argumentsOptional: true)} typAsType ] ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {Symbol typAsType.
							(BlockClosure
								typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
								result: TypUnknownType new
								argumentsOptional: true)} typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithArguments: {}
								result: TypUnknownType new
								argumentsOptional: false ] ] ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifNone: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType new
						argumentsOptional: false ] ];
		resultType: [ :a | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___do: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: TypUnknownType new
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #enumerating }
TypShaPhaCollection >> ___flatCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: TypUnknownType new
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ '@A' typAsVariableType resolveIn: argumentType result ]
						ifFalse: [ TypUnknownType new ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ '@A' typAsVariableType
								resolveIn:
									(TypMethodLookupIndex instance
										resultTypeFor:
											(TypMethodLookup new
												receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
												selector: argumentNode value asSymbol;
												argumentTypes: {};
												argumentNodes: {};
												yourself)) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiverType
				copyWithParameters: {('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: TypUnknownType new
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ '@B' typAsVariableType ] ].
			OrderedDictionary typAsType
				copyWithParameters:
					{('@B' -> keyType).
					('@A'
						->
							(Collection typAsType
								copyWithParameters:
									{('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))}
										asDictionary))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___gtItemsFor: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtPhlowView typAsType ];
		resultType: [ :a :s :r | GtPhlowView typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifEmpty: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifEmpty: _a ifNotEmpty: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType new
						argumentsOptional: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {a receiverType}
						result: TypUnknownType new
						argumentsOptional: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{(a argumentTypes at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifNotEmpty: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {a receiverType}
				result: TypUnknownType new
				argumentsOptional: true)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{a receiverType.
			elementType} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___includesAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType copyWithParameters: {'@A' -> ('@A' typAsVariableType resolveIn: a receiverType)} asDictionary ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___inject: _a into: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments:
							{(a argumentTypes at: 1).
							('@A' typAsVariableType resolveIn: a receiverType)}
						result: TypUnknownType new
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___isEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___isNotEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___max [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Number typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___reduce: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{{('@A' typAsVariableType resolveIn: a receiverType).
					(a argumentTypes at: 1) result} typAsType.
					('@A' typAsVariableType resolveIn: a receiverType)}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___reject: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType at: '@A' ];
		resultType: [ :a :s :r | a receiverType at: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ '@A' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType new
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___select: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___size [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| result |
			result := a receiverType copy.
			'@A' typAsType
				assign:
					{('@A' typAsVariableType resolveIn: a receiverType).
					('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))} typAsType
				in: result.
			result ];
		yourself
]
