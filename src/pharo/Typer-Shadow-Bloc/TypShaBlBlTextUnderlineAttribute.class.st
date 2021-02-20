Class {
	#name : #TypShaBlBlTextUnderlineAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlTextUnderlineAttribute class >> shadowedClass [
	^ BlTextUnderlineAttribute class
]

{ #category : #accessing }
TypShaBlBlTextUnderlineAttribute >> ___paint: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Color typAsType.
			BlPaint typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
