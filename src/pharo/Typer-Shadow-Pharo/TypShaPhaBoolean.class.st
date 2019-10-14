Class {
	#name : #TypShaPhaBoolean,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBoolean class >> shadowedClass [
	^ Boolean class
]

{ #category : #accessing }
TypShaPhaBoolean >> ___and: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___ifFalse: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result asNullableType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___ifTrue: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result asNullableType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___ifTrue: _a ifFalse: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a | 
			(a argumentTypes
				collect: [ :e | 
					e isFunction
						ifTrue: [ e result ]
						ifFalse: [ TypUnknownType instance ] ]) typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___not [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___or: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]
