Class {
	#name : #TypShaPhaBlockClosure,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure class >> shadowedClass [
	^ BlockClosure class
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___cull: _a [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___cull: _a cull: _b [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c cull: _d [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___ensure: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___on: _a do: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Exception class typAsType ]
				ifFalse: [ | first type |
					first := a argumentTypes at: 1.
					type := (first isNamed and: [ first hasClassDescription ])
						ifTrue: [ first classDescription instanceSide typAsType ]
						ifFalse: [ Exception class typAsType ].
					BlockClosure
						typAsFunctionTypeWithArguments: {type}
						result: TypUnknownType new
						argumentsOptional: true ] ];
		resultType: [ :a :s :r | 
			{a receiverType result.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___value [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c value: _d [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a | a receiverType arguments at: i ifAbsent: [ TypUnknownType new ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___whileFalse: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___whileTrue: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: #()
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | TypNilType new ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> asType: aClass [
	^ aClass
		typAsFunctionTypeWithArguments: {}
		result: TypUnknownType new
		argumentsOptional: false
]
