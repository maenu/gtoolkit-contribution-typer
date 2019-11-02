Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance asNullableType ];
		resultType: [ :a :s :r | 
			a receiverType classDescription instanceSide typAsType
				copyWithBindings: {('@A' typAsType -> (a argumentTypes at: 1))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection class >> ___withAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType copyWithBindings: {'@A' typAsType -> ((a argumentTypes first "typCastAs TypParametricType") bindings at: '@A' typAsType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #accessing }
TypShaPhaCollection >> ___add: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindings at: '@A' typAsType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___addAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___allSatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___anySatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
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
			elementType := a receiverType bindings at: '@A' typAsType.
			type := Dictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' typAsType -> (elementType bindings at: '@A' typAsType)).
							('@A' typAsType -> (elementType bindings at: '@B' typAsType))} typAsTypeVariableBindings ].
			type ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asIdentitySet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			IdentitySet typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asOrderedCollection [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := a receiverType bindings at: '@A' typAsType.
			type := OrderedDictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' typAsType -> (elementType bindings at: '@A' typAsType)).
							('@A' typAsType -> (elementType bindings at: '@B' typAsType))} typAsTypeVariableBindings ].
			type ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asSet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Set typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
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
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' typAsType -> elementType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithout: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindings at: '@A' typAsType ];
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
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {Symbol typAsType.
							(BlockClosure
								typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
								result: TypUnknownType instance
								argumentsOptional: true)} typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithArguments: {}
								result: TypUnknownType instance
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
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
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
						typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a | 
			{(a receiverType bindings at: '@A' typAsType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___do: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
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
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ argumentType result bindings at: '@A' typAsType ]
						ifFalse: [ TypUnknownType instance ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ (TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself)) bindings at: '@A' typAsType ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' typAsType -> elementType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
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
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ '@B' typAsType ] ].
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' typAsType -> keyType).
					('@A' typAsType
						->
							(Collection typAsType
								copyWithBindings:
									{('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))}
										typAsTypeVariableBindings))} typAsTypeVariableBindings ];
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
				result: TypUnknownType instance
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
						result: TypUnknownType instance
						argumentsOptional: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {a receiverType}
						result: TypUnknownType instance
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
						ifFalse: [ TypUnknownType instance ] ].
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
				result: TypUnknownType instance
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
						ifFalse: [ TypUnknownType instance ] ].
			{a receiverType.
			elementType} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindings at: '@A' typAsType ];
		resultType: [ Boolean typAsType ];
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
							(a receiverType bindings at: '@A' typAsType)}
						result: TypUnknownType instance
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
					{{(a receiverType bindings at: '@A' typAsType).
					(a argumentTypes at: 1) result} typAsType.
					(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
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
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindings at: '@A' typAsType ];
		resultType: [ :a :s :r | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a receiverType bindings at: '@A' typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
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
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
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

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@A' typAsType}
]

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings:
					{('@A' typAsType
						->
							{(a receiverType bindings at: '@A' typAsType).
							((a argumentTypes at: 1) bindings at: '@A' typAsType)} typAsType)}
						typAsTypeVariableBindings ];
		yourself
]
