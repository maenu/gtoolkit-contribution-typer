Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaSequenceableCollection class >> ___ofSize: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsTypeVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___beginsWith: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___copyFrom: _a to: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___detectIndex: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___detectIndex: _a ifNone: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false ]
				ifFalse: [ {TypUnknownType instance.
					(BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ] ];
		resultType: [ :a | 
			| none |
			none := a argumentTypes at: 2.
			{Integer typAsType.
			((none hasClassDescription
				and: [ none classDescription == BlockClosure ])
				ifTrue: [ none result ]
				ifFalse: [ none ])} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___endsWith: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___first [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___indexOf: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___isEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___last [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___reversed [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___sort: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			| type |
			type := a receiverType isParametric
				ifTrue: [ '@A' typAsTypeVariableType resolveIn: a receiverType ]
				ifFalse: [ TypUnknownType instance ].
			BlockClosure
				typAsFunctionTypeWithArguments:
					{type.
					type}
				result: Boolean typAsType
				argumentsOptional: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{('@A' typAsTypeVariableType resolveIn: a receiverType).
					Integer typAsType}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings: {('@A' -> (a argumentTypes at: 1) result)} asDictionary ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> ___withIndexDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{('@A' typAsTypeVariableType resolveIn: a receiverType).
					Integer typAsType}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexSelect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{('@A' typAsTypeVariableType resolveIn: a receiverType).
					Integer typAsType}
				result: Boolean typAsType
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@A'}
]
