Class {
	#name : #TypShaBrBrGlamorousIcons,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #shadow }
TypShaBrBrGlamorousIcons class >> mBrowse: aLookup [ 
	<typShaMethod: 'browse'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Form typAsType ];
		yourself
]

{ #category : #shadow }
TypShaBrBrGlamorousIcons class >> mInspect: aLookup [ 
	<typShaMethod: 'inspect'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Form typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBrBrGlamorousIcons class >> shadowedClass [
	^ BrGlamorousIcons class
]
