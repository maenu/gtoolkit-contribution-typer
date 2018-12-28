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
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___asClassInEnvironment: _a ifAbsent: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ SystemDictionary typAsType
						asParametricType:
							{String typAsType.
							Class typAsType} ]
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
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RPackage typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___join: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Collection typAsType asParametricType: {String typAsType} ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___keywords [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | SequenceableCollection typAsType asParametricType: {String typAsType} ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> ___split: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | SequenceableCollection typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #accessing }
TypShaPhaString >> ___translated [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {Character typAsType}
]
