Class {
	#name : #TypShaPhaBlockClosure,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure class >> shadowedClass [
	^ BlockClosure class
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _cull: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _cull: _a cull: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _cull: _a cull: _b cull: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _cull: _a cull: _b cull: _c cull: _d [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _value: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _value: _a value: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _value: _a value: _b value: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> _value: _a value: _b value: _c value: _d [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters last ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> typShaAsType: aClass [
	^ TypParametricType new
		type: aClass typAsNamedType;
		parameters: {TypUnknownType instance};
		yourself
]
