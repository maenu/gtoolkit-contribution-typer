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
TypShaPhaBlockClosure >> ___cull: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c cull: _d [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___on: _a do: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Class typAsType ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {Exception typAsType} result: TypUnknownType instance ] ];
		resultType: [ :a :s :r | 
			{a receiverType result.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c value: _d [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> asType: aClass [
	^ aClass typAsNamedType asFunctionType: {} result: TypUnknownType instance
]
