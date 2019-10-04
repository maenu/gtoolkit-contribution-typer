Class {
	#name : #TypShaPhaDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaDictionary class >> shadowedClass [
	^ Dictionary class
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' -> (a receiverType bindingAt: '@B')).
					('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___associations [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithBindings:
					{('@A'
						->
							(Association typAsType
								copyWithBindings:
									{('@A' -> (a receiverType bindingAt: '@B')).
									('@B' -> (a receiverType bindingAt: '@A'))}
										asOrderedDictionary))} asOrderedDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___associationsDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asFunctionType:
					{(Association typAsType
						copyWithBindings:
							{('@A' -> (a receiverType bindingAt: '@B')).
							('@B' -> (a receiverType bindingAt: '@A'))}
								asOrderedDictionary)}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindingAt: '@B' ];
		resultType: [ :a :s :r | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType bindingAt: '@B' ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: (a receiverType bindingAt: '@A') optionalParameters: false ] ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{(a receiverType bindingAt: '@B').
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: true).
			(BlockClosure typAsType
				asFunctionType: {}
				result: TypUnknownType instance
				optionalParameters: false)} ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a put: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType bindingAt: '@B' ]
				ifFalse: [ a receiverType bindingAt: '@A' ] ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindingAt: '@A')}
				result: TypUnknownType instance
				optionalParameters: false)} typAsType ];
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
										receiverType: (a receiverType bindingAt: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings:
					{('@B' -> (a receiverType bindingAt: '@B')).
					('@A' -> elementType)} asOrderedDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindingAt: '@A' ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includesKey: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindingAt: '@B' ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___keys [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Collection typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@B'))} asOrderedDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> asType: aClass [
	^ aClass typAsParametricType:
			{('@B' -> (TypTypeVariableType named: '@B')).
			('@A' -> (TypTypeVariableType named: '@A'))} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaDictionary >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Dictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings:
					{('@B'
						->
							{(a receiverType bindingAt: '@B').
							((a argumentTypes at: 1) bindingAt: '@B')} typAsType).
					('@A'
						->
							{(a receiverType bindingAt: '@A').
							((a argumentTypes at: 1) bindingAt: '@A')} typAsType)}
						asOrderedDictionary ];
		yourself
]
