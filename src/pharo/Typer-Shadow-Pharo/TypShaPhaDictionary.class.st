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
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___asOrderedDictionary [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					(a receiverType parameters at: 2)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___associations [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Collection typAsType
				asParametricType:
					{(Association typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 2)})} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___associationsDo: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asFunctionType:
					{(Association typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 2)})}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType parameters at: 1 ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: (a receiverType parameters at: 2) optionalParameters: false ] ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a put: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___collect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 2)} result: TypUnknownType instance optionalParameters: false ];
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
										receiverType: (a receiverType parameters at: 2);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				asParametricType:
					{(a receiverType parameters at: 1).
					elementType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 2 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includesKey: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___keys [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | Collection typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> asType: aClass [
	^ aClass typAsNamedType
		asParametricType:
			{TypUnknownType instance.
			TypUnknownType instance}
]
