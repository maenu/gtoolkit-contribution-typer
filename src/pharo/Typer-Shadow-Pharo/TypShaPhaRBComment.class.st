Class {
	#name : #TypShaPhaRBComment,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBComment class >> shadowedClass [
	^ RBComment class
]

{ #category : #shadow }
TypShaPhaRBComment >> mContents: aLookup [ 
	<typShaMethod: 'contents'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBComment >> mStart: aLookup [ 
	<typShaMethod: 'start'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBComment >> mStop: aLookup [ 
	<typShaMethod: 'stop'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]
