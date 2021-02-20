Class {
	#name : #TypShaPhaOCLiteralVariable,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable class >> shadowedClass [
	^ OCLiteralVariable class
]

{ #category : #accessing }
TypShaPhaOCLiteralVariable >> ___assoc [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Association typAsType
				copyWithParameters:
					{('@A' -> String typAsType).
					('@B' -> TypUnknownType new)} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> ___isClassVariable [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> ___isFromSharedPool [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> ___isGlobalClassNameBinding [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> ___isGlobalVariable [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOCLiteralVariable >> ___scope [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | OCAbstractScope typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOCLiteralVariable >> ___value [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Object typAsType ];
		yourself
]
