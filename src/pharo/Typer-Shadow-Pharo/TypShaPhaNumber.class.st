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
	^ TypFunctionType new
		argumentTypes: [ BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: true
				signalsAlways: false ];
		resultType: [ :a | 
			OrderedCollection typAsType
				copyWithParameters:
					{('@A'
						->
							(a argumentTypes
								collect: [ :e | 
									e isFunction
										ifTrue: [ e result ]
										ifFalse: [ TypUnknownType new ] ]) typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			Interval typAsType
				copyWithParameters:
					{('@A'
						->
							{a receiverType.
							(a argumentTypes at: 1)} typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ___to: _a do: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Number typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments:
							{{a receiverType.
							(a argumentTypes at: 1)} typAsType}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~~~+ _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~~~- _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]
