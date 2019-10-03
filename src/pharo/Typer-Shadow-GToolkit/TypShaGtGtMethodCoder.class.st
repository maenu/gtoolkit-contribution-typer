Class {
	#name : #TypShaGtGtMethodCoder,
	#superclass : #TypShaShadow,
	#instVars : [
		'___astCache'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtMethodCoder class >> ___forMethod: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoder class >> shadowedClass [
	^ GtMethodCoder class
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___asElement [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderMethodElement typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___compiledMethod [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___cursorPositionDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {Integer typAsType} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___newCompletionStrategy [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCompletionStrategy typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___newSourceStyler [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderTextStyler typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___rbAST [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___save [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___selector [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___updateMethod: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #initialization }
TypShaGtGtMethodCoder >> initialize [
	super initialize.
	___astCache := TypVariableLookupResult new
		type: [ :a :s :r | 
			Association typAsType
				asParametricType:
					{('@A' -> String typAsType).
					('@B' -> RBMethodNode typAsType)} asOrderedDictionary ];
		yourself
]
