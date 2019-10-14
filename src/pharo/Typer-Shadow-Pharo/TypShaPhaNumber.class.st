Class {
	#name : #TypShaPhaNumber,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaNumber class >> shadowedClass [
	^ Number class
]

{ #category : #accessing }
TypShaPhaNumber >> ___timesCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ BlockClosure
				typAsFunctionTypeWithArguments: {Integer typAsType}
				result: TypUnknownType instance
				argumentsOptional: true ];
		resultType: [ :a | 
			OrderedCollection typAsType
				copyWithBindings:
					{('@A' typAsType
						->
							(a argumentTypes
								collect: [ :e | 
									e isFunction
										ifTrue: [ e result ]
										ifFalse: [ TypUnknownType instance ] ]) typAsType)}
						typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			Interval typAsType
				copyWithBindings:
					{('@A' typAsType
						->
							{a receiverType.
							(a argumentTypes at: 1)} typAsType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a do: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Number typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments:
							{{a receiverType.
							(a argumentTypes at: 1)} typAsType}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
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
