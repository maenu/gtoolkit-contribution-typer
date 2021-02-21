Class {
	#name : #TypShaBrBrTextLabelLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextLabelLook class >> shadowedClass [
	^ BrTextLabelLook class
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mFontSize: aLookup [ 
	<typShaMethod: 'fontSize:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mForeground: aLookup [ 
	<typShaMethod: 'foreground:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Color typAsType.
			BlPaint typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
