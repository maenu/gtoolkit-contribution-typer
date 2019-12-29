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
		resultType: [ :a | a receiverType at: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' -> (a receiverType at: '@B')).
					('@A' -> (a receiverType at: '@A'))} asDictionary ];
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
									{('@A' -> (a receiverType at: '@B')).
									('@B' -> (a receiverType at: '@A'))} asDictionary))}
						asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___associationsDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{(Association typAsType
						copyWithBindings:
							{('@A' -> (a receiverType at: '@B')).
							('@B' -> (a receiverType at: '@A'))} asDictionary)}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType at: '@B' ];
		resultType: [ :a :s :r | a receiverType at: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType at: '@B' ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: (a receiverType at: '@A')
						argumentsOptional: false ] ];
		resultType: [ :a | a receiverType at: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___at: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{(a receiverType at: '@B').
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType at: '@A')}
				result: TypUnknownType instance
				argumentsOptional: true).
			(BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false)} ];
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
				ifTrue: [ a receiverType at: '@B' ]
				ifFalse: [ a receiverType at: '@A' ] ];
		resultType: [ :a | a receiverType at: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType at: '@A')}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
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
										receiverType: (a receiverType at: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings:
					{('@B' -> (a receiverType at: '@B')).
					('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType at: '@A' ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includesKey: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType at: '@B' ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___keys [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Collection typAsType
				copyWithBindings: {('@A' -> (a receiverType at: '@B'))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___keysAndValuesDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{(a receiverType at: '@B').
					(a receiverType at: '@A')}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___removeKey: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i == 1
				ifTrue: [ '@B' typAsTypeVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: #()
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsTypeVariableType resolveIn: a receiverType).
			a argumentTypes first result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___values [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings:
					{('@A' -> ((a receiverType "typCastAs TypParametricType") at: '@A'))}
						asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@B' . '@A'}
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
							{(a receiverType at: '@B').
							((a argumentTypes at: 1) at: '@B')} typAsType).
					('@A'
						->
							{(a receiverType at: '@A').
							((a argumentTypes at: 1) at: '@A')} typAsType)} asDictionary ];
		yourself
]
