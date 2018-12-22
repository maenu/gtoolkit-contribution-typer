Class {
	#name : #TypShaPhaProtoObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject class >> shadowedClass [
	^ ProtoObject class
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___flag: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___ifNil: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 1.
			(node isBlock
				and: [ node body statements size > 0 and: [ node body statements last isReturn ] ])
				ifTrue: [ a receiverType asNonNullableType ]
				ifFalse: [ {a receiverType.
					(a argumentTypes at: 1) result} typAsType ] ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ~~~== _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{TypUnknownType instance.
			TypNilType instance} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject >> ~~~~~ _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{TypUnknownType instance.
			TypNilType instance} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
