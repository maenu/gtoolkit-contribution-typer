Class {
	#name : #TypShaGtGtCoderTextStyler,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtCoderTextStyler class >> ___forCoder: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodCoder typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderTextStyler class >> shadowedClass [
	^ GtCoderTextStyler class
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> ___extraStyle: _a ast: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlText typAsType ]
				ifFalse: [ RBMethodNode typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> ___style: _a ast: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlText typAsType ]
				ifFalse: [ RBMethodNode typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderTextStyler >> vCoder: aLookup [
	<typShaForVariable: #coder>
	^ GtMethodCoder typAsType
]
