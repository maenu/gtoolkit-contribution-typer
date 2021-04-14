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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{String typAsType.
			BlText typAsType} typAsType}
]
