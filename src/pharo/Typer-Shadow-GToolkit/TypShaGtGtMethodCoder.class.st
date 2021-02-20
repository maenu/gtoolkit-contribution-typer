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
	^ TypFunctionType new
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
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderMethodElement typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___compiledMethod [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___cursorPositionDo: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___newCompletionStrategy [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCompletionStrategy typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___newSourceStyler [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtCoderTextStyler typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___rbAST [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___save [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___selector [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoder >> ___updateMethod: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #initialization }
TypShaGtGtMethodCoder >> initialize [
	super initialize.
	self flag: 'FIXME breaks lookup'
	"___astCache := Association typAsType
		copyWithParameters:
			{('@A' -> String typAsType).
			('@B' -> RBMethodNode typAsType)} asOrderedDictionary"
]
