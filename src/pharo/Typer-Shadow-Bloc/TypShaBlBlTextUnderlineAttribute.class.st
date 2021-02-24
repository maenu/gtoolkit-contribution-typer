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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Color typAsType.
			BlPaint typAsType} typAsType}
]
