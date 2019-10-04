Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #accessing }
TypShaPhaString >> ___asClass [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___asClassInEnvironment: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ SystemDictionary typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType: {}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 2.
			(node isBlock
				and: [ node body statements size > 0
						and: [ node body statements last isReturn ] ])
				ifTrue: [ Class typAsType ]
				ifFalse: [ {Class typAsType.
					(a argumentTypes at: 1) result} typAsType ] ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___asPackage [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RPackage typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___includesSubstring: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___join: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> String typAsType)} asOrderedDictionary ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___keywords [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> String typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> ___split: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | SequenceableCollection typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> (a argumentTypes at: 1))} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___translated [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> asType: aClass [
	| type |
	type := aClass typAsNamedType.
	type
		superType:
			(type superType
				copyWithBindings: {('@A' -> Character typAsType)} asOrderedDictionary).
	^ type
]
