Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaSequenceableCollection class >> ___ofSize: _a [
	^ TypFunctionType new
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
	^ TypFunctionType new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a ifAbsent: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{('@A' typAsVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___beginsWith: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___copyFrom: _a to: _b [
	^ TypFunctionType new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___detectIndex: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___detectIndex: _a ifNone: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {('@A' typAsVariableType resolveIn: a receiverType)}
						argumentsOptional: false
						signalsAlways: false ]
				ifFalse: [ {TypUnknownType new.
					(BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {}
						argumentsOptional: false
						signalsAlways: false)} typAsType ] ];
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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___first [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___indexOf: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___isEmpty [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___last [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___reversed [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___sort: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			| type |
			type := a receiverType isParametric
				ifTrue: [ '@A' typAsVariableType resolveIn: a receiverType ]
				ifFalse: [ TypUnknownType new ].
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{type.
					type}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexCollect: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType:
				[ :a :s :r | a receiverType copyWithParameters: {(a argumentTypes at: 1) result} ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> ___withIndexDo: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexSelect: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments:
					{('@A' typAsVariableType resolveIn: a receiverType).
					Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
