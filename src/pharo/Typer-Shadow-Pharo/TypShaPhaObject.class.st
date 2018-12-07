Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> _new [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #accessing }
TypShaPhaObject >> _class [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> _copy [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> _hash [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> _yourself [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~-> _a [
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
TypShaPhaObject >> ~= _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Object typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
