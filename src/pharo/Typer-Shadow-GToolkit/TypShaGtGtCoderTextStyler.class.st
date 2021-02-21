Class {
	#name : #TypShaGtGtCoderTextStyler,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtCoderTextStyler class >> mForCoder: aLookup [ 
	<typShaMethod: 'forCoder:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodCoder typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderTextStyler class >> shadowedClass [
	^ GtCoderTextStyler class
]

{ #category : #shadow }
TypShaGtGtCoderTextStyler >> mExtraStyleAst: aLookup [ 
	<typShaMethod: 'extraStyle:ast:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlText typAsType ]
				ifFalse: [ RBMethodNode typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderTextStyler >> mStyleAst: aLookup [ 
	<typShaMethod: 'style:ast:'>
	
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
