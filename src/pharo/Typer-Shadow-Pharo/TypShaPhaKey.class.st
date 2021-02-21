Class {
	#name : #TypShaPhaKey,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaKey class >> mH: aLookup [ 
	<typShaMethod: 'h'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Key typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaKey class >> mT: aLookup [ 
	<typShaMethod: 't'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Key typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaKey class >> shadowedClass [
	^ Key class
]
