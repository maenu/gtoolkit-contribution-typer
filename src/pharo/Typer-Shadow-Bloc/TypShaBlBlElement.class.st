Class {
	#name : #TypShaBlBlElement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlElement class >> shadowedClass [
	^ BlElement class
]

{ #category : #accessing }
TypShaBlBlElement >> ___look: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{BrLook class typAsType.
			BrLook typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
