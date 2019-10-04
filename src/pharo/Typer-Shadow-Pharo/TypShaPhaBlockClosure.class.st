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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ifAbsent: [ TypUnknownType instance ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___cull: _a cull: _b cull: _c cull: _d [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___ensure: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___on: _a do: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Exception class typAsType ]
				ifFalse: [ | first type |
					first := a argumentTypes at: 1.
					type := first representsClassDescription
						ifTrue: [ first classDescription instanceSide typAsType ]
						ifFalse: [ Exception class typAsType ].
					BlockClosure typAsType
						asFunctionType: {type}
						result: TypUnknownType instance
						optionalParameters: true ] ];
		resultType: [ :a :s :r | 
			{a receiverType result.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ifAbsent: [ TypUnknownType instance ] ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> ___value: _a value: _b value: _c value: _d [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType result ];
		yourself
]

{ #category : #accessing }
TypShaPhaBlockClosure >> ___whileFalse: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure >> asType: aClass [
	self flag: 'FIXME use proper function and parametric types'.
	^ (super asType: aClass) asFunctionType: {} result: TypUnknownType instance optionalParameters: false
]
