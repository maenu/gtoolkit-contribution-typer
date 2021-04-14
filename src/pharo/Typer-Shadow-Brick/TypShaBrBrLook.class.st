Class {
	#name : #TypShaBrBrLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #shadow }
TypShaBrBrLook class >> mBinary26: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrLook typAsType
		arguments:
			{{BrLook typAsType.
			BrLook class typAsType} typAsType}
]

{ #category : #'as yet unclassified' }
TypShaBrBrLook class >> shadowedClass [
	^ BrLook class
]
