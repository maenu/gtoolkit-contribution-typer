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
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
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
				copyWithParameters: {('@A' -> String typAsType)} asDictionary ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___keywords [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> String typAsType)} asDictionary ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> ___split: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | SequenceableCollection typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> (a argumentTypes at: 1))} asDictionary ];
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
	^ aClass == String
		ifTrue: [ aClass
				typAsNamedTypeWithSuperTypeParameters: {('@A' -> Character typAsType)} asDictionary ]
		ifFalse: [ aClass typAsNamedType ]
]
