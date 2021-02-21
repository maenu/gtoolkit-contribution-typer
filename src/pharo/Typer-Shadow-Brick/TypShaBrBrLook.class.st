Class {
	#name : #TypShaBrBrLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #shadow }
TypShaBrBrLook class >> mBinary26: aLookup [ 
	<typShaMethod: '+'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{BrLook typAsType.
			BrLook class typAsType} typAsType ];
		resultType: [ :a :s :r | BrLook typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBrBrLook class >> shadowedClass [
	^ BrLook class
]
