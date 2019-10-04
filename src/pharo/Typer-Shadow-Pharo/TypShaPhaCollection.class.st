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
				copyWithBindings: {('@A' -> (a argumentTypes at: 1))} asOrderedDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #accessing }
TypShaPhaCollection >> ___add: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindingAt: '@A' ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___addAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___allSatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: Boolean typAsType
				optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anySatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := a receiverType bindingAt: '@A'.
			type := Dictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' -> (elementType bindingAt: '@A')).
							('@A' -> (elementType bindingAt: '@B'))} asOrderedDictionary ].
			type ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asIdentitySet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			IdentitySet typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asOrderedCollection [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := a receiverType bindingAt: '@A'.
			type := OrderedDictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' -> (elementType bindingAt: '@A')).
							('@A' -> (elementType bindingAt: '@B'))} asOrderedDictionary ].
			type ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asSet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Set typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: false)} typAsType ];
		resultType: [ :a | 
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
										receiverType: (a receiverType bindingAt: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' -> elementType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithout: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindingAt: '@A' ];
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

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {String typAsType.
							(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: TypUnknownType instance optionalParameters: true)} typAsType ]
						ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ] ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (a receiverType bindingAt: '@A');
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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ];
		resultType: [ :a | 
			{(a receiverType bindingAt: '@A').
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___do: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: TypUnknownType instance optionalParameters: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #enumerating }
TypShaPhaCollection >> ___flatCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ argumentType result bindingAt: '@A' ]
						ifFalse: [ TypUnknownType instance ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: String)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ (TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (a receiverType bindingAt: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself)) bindingAt: '@A' ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' -> elementType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: String)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (a receiverType bindingAt: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			Dictionary typAsType
				copyWithBindings:
					{('@B' -> keyType).
					('@A'
						->
							(Collection typAsType
								copyWithBindings: {(a receiverType bindingAt: '@A')}))}
						asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___gtItemsFor: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtPhlowView typAsType ];
		resultType: [ :a :s :r | GtPhlowView typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___ifEmpty: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
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

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___ifNotEmpty: _a [
	^ TypMethodLookupResult new
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
		argumentTypes: [ :i :a | a receiverType bindingAt: '@A' ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___inject: _a into: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType:
							{(a argumentTypes at: 1).
							(a receiverType bindingAt: '@A')}
						result: TypUnknownType instance
						optionalParameters: false ] ];
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
			BlockClosure typAsType
				asFunctionType:
					{{(a receiverType bindingAt: '@A').
					(a argumentTypes at: 1) result} typAsType.
					(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___reject: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindingAt: '@A' ];
		resultType: [ :a :s :r | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a receiverType bindingAt: '@A' ]
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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false)} typAsType ];
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
	^ aClass typAsParametricType: {('@A' -> (TypTypeVariableType named: '@A'))} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings:
					{('@A'
						->
							{(a receiverType bindingAt: '@A').
							((a argumentTypes at: 1) bindingAt: '@A')} typAsType)}
						asOrderedDictionary ];
		yourself
]
