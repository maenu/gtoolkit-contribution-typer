Class {
	#name : #TypShaBlBlInsets,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #accessing }
TypShaBlBlInsets class >> ___top: _a right: _b bottom: _c left: _d [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBlBlInsets class >> shadowedClass [
	^ BlInsets class
]
