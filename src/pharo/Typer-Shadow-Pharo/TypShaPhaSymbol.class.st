Class {
	#name : #TypShaPhaSymbol,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSymbol class >> shadowedClass [
	^ Symbol class
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsBinary: aLookup [ 
	<typShaMethod: 'isBinary'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsKeyword: aLookup [ 
	<typShaMethod: 'isKeyword'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsUnary: aLookup [ 
	<typShaMethod: 'isUnary'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
