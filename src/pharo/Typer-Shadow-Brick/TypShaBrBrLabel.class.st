Class {
	#name : #TypShaBrBrLabel,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrLabel class >> shadowedClass [
	^ BrLabel class
]

{ #category : #shadow }
TypShaBrBrLabel >> mText: aLookup [ 
	<typShaMethod: 'text:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			BlText typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
