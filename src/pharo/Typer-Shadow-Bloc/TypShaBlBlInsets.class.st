Class {
	#name : #TypShaBlBlInsets,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #shadow }
TypShaBlBlInsets class >> mTopRightBottomLeft: aLookup [ 
	<typShaMethod: 'top:right:bottom:left:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBlBlInsets class >> shadowedClass [
	^ BlInsets class
]
