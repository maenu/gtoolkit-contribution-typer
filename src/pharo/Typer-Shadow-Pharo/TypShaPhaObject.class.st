Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> ___new [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___asSymbol [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___class [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___copy [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___hash [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___ifNil: _a ifNotNil: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {a receiverType} result: TypUnknownType instance ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1) result.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___printString [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___yourself [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~-> _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a argumentTypes at: 1 ];
		resultType: [ :a :s :r | 
			Association typAsType
				asParametricType:
					{a receiverType.
					(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~= _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Object typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
