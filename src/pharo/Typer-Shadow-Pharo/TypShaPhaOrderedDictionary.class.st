Class {
	#name : #TypShaPhaOrderedDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary class >> shadowedClass [
	^ OrderedDictionary class
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___anyOne [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___asOrderedDictionary [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithParameters:
					{('@B' -> ('@B' typAsVariableType resolveIn: a receiverType)).
					('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))}
						asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___associations [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithParameters:
					{('@A'
						->
							(Association typAsType
								copyWithParameters:
									{('@A' -> ('@B' typAsVariableType resolveIn: a receiverType)).
									('@B' -> ('@A' typAsVariableType resolveIn: a receiverType))}
										asDictionary))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___associationsDo: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{(Association typAsType
						copyWithParameters:
							{('@A' -> ('@B' typAsVariableType resolveIn: a receiverType)).
							('@B' -> ('@A' typAsVariableType resolveIn: a receiverType))}
								asDictionary)}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | '@B' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: ('@A' typAsVariableType resolveIn: a receiverType)
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a ifPresent: _b ifAbsent: _c [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: true
				signalsAlways: false).
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___at: _a put: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ '@B' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ '@A' typAsVariableType resolveIn: a receiverType ] ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___collect: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
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
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			a receiverType
				copyWithParameters:
					{('@B' -> (a receiverType at: '@B')).
					('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___includes: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___includesKey: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | '@B' typAsVariableType resolveIn: a receiverType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___keys [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithParameters:
					{('@A' -> ('@B' typAsVariableType resolveIn: a receiverType))}
						asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters:
			{('@B' -> '@B' typAsVariableType).
			('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ~~~, _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | OrderedDictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithParameters:
					{('@B'
						->
							{('@B' typAsVariableType resolveIn: a receiverType).
							('@B' typAsVariableType resolveIn: (a argumentTypes at: 1))}
								typAsType).
					('@A'
						->
							{('@A' typAsVariableType resolveIn: a receiverType).
							('@A' typAsVariableType resolveIn: (a argumentTypes at: 1))}
								typAsType)} asDictionary ];
		yourself
]
