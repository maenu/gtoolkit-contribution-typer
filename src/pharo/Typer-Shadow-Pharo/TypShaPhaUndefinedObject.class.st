Class {
	#name : #TypShaPhaUndefinedObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaUndefinedObject class >> shadowedClass [
	^ UndefinedObject class
]

{ #category : #accessing }
TypShaPhaUndefinedObject >> ___ifNil: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 1.
			(node isBlock
				and: [ node body statements size > 0
						and: [ node body statements last isReturn ] ])
				ifTrue: [ TypNoTypeError signal ]
				ifFalse: [ (a argumentTypes at: 1) result ] ];
		yourself
]

{ #category : #accessing }
TypShaPhaUndefinedObject >> ___ifNotNil: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {a receiverType asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
