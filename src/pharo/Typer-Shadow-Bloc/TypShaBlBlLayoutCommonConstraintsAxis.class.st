Class {
	#name : #TypShaBlBlLayoutCommonConstraintsAxis,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlLayoutCommonConstraintsAxis class >> shadowedClass [
	^ BlLayoutCommonConstraintsAxis class
]

{ #category : #shadow }
TypShaBlBlLayoutCommonConstraintsAxis >> mExact: aLookup [ 
	<typShaMethod: 'exact:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
