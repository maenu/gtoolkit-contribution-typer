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
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' typAsType -> (a receiverType bindings at: '@B' typAsType)).
					('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___associations [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithBindings:
					{('@A' typAsType
						->
							(Association typAsType
								copyWithBindings:
									{('@A' typAsType -> (a receiverType bindings at: '@B' typAsType)).
									('@B' typAsType -> (a receiverType bindings at: '@A' typAsType))}
										typAsTypeVariableBindings))} typAsTypeVariableBindings ];
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
							{('@A' typAsType -> (a receiverType bindings at: '@B' typAsType)).
							('@B' typAsType -> (a receiverType bindings at: '@A' typAsType))}
								typAsTypeVariableBindings)}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindings at: '@B' typAsType ];
		resultType: [ :a :s :r | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType bindings at: '@B' typAsType ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: (a receiverType bindings at: '@A' typAsType) optionalParameters: false ] ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{(a receiverType bindings at: '@B' typAsType).
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindings at: '@A' typAsType)}
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
				ifTrue: [ a receiverType bindings at: '@B' typAsType ]
				ifFalse: [ a receiverType bindings at: '@A' typAsType ] ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType
				asFunctionType: {(a receiverType bindings at: '@A' typAsType)}
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
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings:
					{('@B' typAsType -> (a receiverType bindings at: '@B' typAsType)).
					('@A' typAsType -> elementType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindings at: '@A' typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includesKey: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindings at: '@B' typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___keys [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Collection typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@B' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> asType: aClass [
	^ aClass
		typAsParametricType:
			{'@B' typAsType.
			'@A' typAsType}
]

{ #category : #accessing }
TypShaPhaDictionary >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Dictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings:
					{('@B' typAsType
						->
							{(a receiverType bindings at: '@B' typAsType).
							((a argumentTypes at: 1) bindings at: '@B' typAsType)} typAsType).
					('@A' typAsType
						->
							{(a receiverType bindings at: '@A' typAsType).
							((a argumentTypes at: 1) bindings at: '@A' typAsType)} typAsType)}
						typAsTypeVariableBindings ];
		yourself
]
