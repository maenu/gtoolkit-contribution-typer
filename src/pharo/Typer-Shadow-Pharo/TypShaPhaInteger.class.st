Class {
	#name : #TypShaPhaInteger,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaInteger class >> shadowedClass [
	^ Integer class
]

{ #category : #shadow }
TypShaPhaInteger >> mAsCharacter: aLookup [ 
	<typShaMethod: 'asCharacter'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Character typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaInteger >> mAtRandom: aLookup [ 
	<typShaMethod: 'atRandom'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaInteger >> mBitXor: aLookup [ 
	<typShaMethod: 'bitXor:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]
