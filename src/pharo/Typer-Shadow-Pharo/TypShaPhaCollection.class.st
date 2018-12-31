Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance asNullableType ];
		resultType:
				[ :a :s :r | a receiverType asClass instanceSide typAsType asParametricType: {(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #accessing }
TypShaPhaCollection >> ___add: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType parameters at: 1 ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___addAll: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Collection typAsType asParametricType: {a receiverType parameters at: 1} ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___allSatisfy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType parameters at: 1)}
				result: Boolean typAsType
				optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anyOne [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anySatisfy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asDictionary [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType |
			elementType := a receiverType parameters at: 1.
			Dictionary typAsType
				asParametricType:
					(Association typAsType >= elementType
						ifTrue: [ {(elementType parameters at: 1).
							(elementType parameters at: 2)} ]
						ifFalse: [ {TypUnknownType instance.
							TypUnknownType instance} ]) ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asIdentitySet [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | IdentitySet typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asOrderedCollection [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asSet [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | Set typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___at: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: TypUnknownType instance optionalParameters: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType asParametricType: {elementType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithout: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType parameters at: 1 ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithoutAll: _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType asParametricType: {TypUnknownType instance} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {String typAsType.
							(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: TypUnknownType instance optionalParameters: true)} typAsType ]
						ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ] ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a ifNone: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ];
		resultType: [ :a | 
			{(a receiverType parameters at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___do: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: TypUnknownType instance optionalParameters: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #enumerating }
TypShaPhaCollection >> ___flatCollect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: TypUnknownType instance optionalParameters: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ argumentType result parameters at: 1 ]
						ifFalse: [ TypUnknownType instance ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ (TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself)) parameters at: 1 ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType asParametricType: {elementType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: TypUnknownType instance optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			Dictionary typAsType
				asParametricType:
					{keyType.
					(Collection typAsType asParametricType: {(a receiverType parameters at: 1)})} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___gtItemsFor: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtPhlowView typAsType ];
		resultType: [ :a :s :r | GtPhlowView typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___ifEmpty: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifEmpty: _a ifNotEmpty: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ]
				ifFalse: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {a receiverType} result: TypUnknownType instance optionalParameters: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
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

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___ifNotEmpty: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {a receiverType} result: TypUnknownType instance optionalParameters: true)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
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
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___inject: _a into: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType:
							{(a argumentTypes at: 1).
							(a receiverType parameters at: 1)}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___isNotEmpty [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___max [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Number typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___reject: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType parameters at: 1 ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a ifAbsent: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a receiverType parameters at: 1 ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType: {}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___select: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___size [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {TypUnknownType instance}
]

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType asParametricType: {TypUnknownType instance} ];
		resultType: [ :a :s :r | 
			a receiverType
				asParametricType:
					{{(a receiverType parameters at: 1).
					((a argumentTypes at: 1) parameters at: 1)} typAsType} ];
		yourself
]
