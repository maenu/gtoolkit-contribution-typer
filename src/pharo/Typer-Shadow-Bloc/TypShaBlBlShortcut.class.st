Class {
	#name : #TypShaBlBlShortcut,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlShortcut class >> shadowedClass [
	^ BlShortcut class
]

{ #category : #accessing }
TypShaBlBlShortcut >> ___action: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {BlElement typAsType} result: TypUnknownType instance ];
		resultType: [ :a :s :r | BlShortcut typAsType ];
		yourself
]
