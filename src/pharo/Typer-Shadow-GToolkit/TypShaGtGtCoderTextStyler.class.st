Class {
	#name : #TypShaGtGtCoderTextStyler,
	#superclass : #TypShaShadow,
	#instVars : [
		'___coder'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtCoderTextStyler class >> ___forCoder: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtMethodCoder typAsType ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderTextStyler class >> shadowedClass [
	^ GtCoderTextStyler class
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> ___extraStyle: _a ast: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlText typAsType ]
				ifFalse: [ RBMethodNode typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> ___style: _a ast: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlText typAsType ]
				ifFalse: [ RBMethodNode typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> initialize [
	super initialize.
	___coder := TypVariableLookupResult new
		type: [ :a :s :r | GtMethodCoder typAsType ];
		yourself
]
