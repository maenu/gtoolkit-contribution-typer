Class {
	#name : #TypShaBlBlTextUnderlineAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlTextUnderlineAttribute class >> shadowedClass [
	^ BlTextUnderlineAttribute class
]

{ #category : #shadow }
TypShaBlBlTextUnderlineAttribute >> mPaint: aLookup [
	<typShaMethod: 'paint:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Color typAsType.
			BlPaint typAsType} typAsType}
]
