Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #accessing }
TypShaPhaObject >> ___asString [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___asSymbol [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___assert: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___copy [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___hash [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___instVarNamed: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isBlock [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isKindOf: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | {ClassDescription typAsType} at: i ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isNotNil [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___perform: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | 
			| argument |
			argument := a argumentNodes at: 1.
			(argument isLiteralNode and: [ argument value isSymbol ])
				ifTrue: [ TypMethodLookupIndex instance
						resultTypeFor:
							(TypMethodLookup new
								receiverType: a receiverType;
								selector: argument value;
								argumentTypes: #();
								argumentNodes: #();
								yourself) ]
				ifFalse: [ TypUnknownType new ] ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___perform: _a withEnoughArguments: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ SequenceableCollection typAsType ] ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___printOn: _a [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Stream typAsType copyWithParameters: {Character typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___printString [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___yourself [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~-> _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | a argumentTypes at: 1 ];
		resultType: [ :a :s :r | 
			Association typAsType
				copyWithParameters:
					{a receiverType.
					(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~= _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Object typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ~~~~= _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
