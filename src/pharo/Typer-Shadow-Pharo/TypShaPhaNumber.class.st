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
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asFunctionType: {Integer typAsType} result: TypUnknownType instance optionalParameters: true ];
		resultType: [ :a | 
			OrderedCollection typAsType
				asParametricType:
					{(a argumentTypes
						collect: [ :e | 
							e isFunction
								ifTrue: [ e result ]
								ifFalse: [ TypUnknownType instance ] ]) typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			Interval typAsType
				asParametricType:
					{{a receiverType.
					(a argumentTypes at: 1)} typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a do: _b [
	^ TypMethodResolver new
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
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~~~- _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]
