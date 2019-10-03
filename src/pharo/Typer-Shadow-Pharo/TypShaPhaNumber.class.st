Class {
	#name : #TypShaPhaNumber,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaNumber class >> shadowedClass [
	^ Number class
]

{ #category : #'as yet unclassified' }
TypShaPhaNumber >> ___timesCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ BlockClosure typAsType
				asFunctionType: {Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: true ];
		resultType: [ :a | 
			OrderedCollection typAsType
				asParametricType:
					{('@A'
						->
							(a argumentTypes
								collect: [ :e | 
									e isFunction
										ifTrue: [ e result ]
										ifFalse: [ TypUnknownType instance ] ]) typAsType)}
						asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			Interval typAsType
				asParametricType:
					{('@A'
						->
							{a receiverType.
							(a argumentTypes at: 1)} typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a do: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Number typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType:
							{{a receiverType.
							(a argumentTypes at: 1)} typAsType}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~~~+ _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~~~- _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]
