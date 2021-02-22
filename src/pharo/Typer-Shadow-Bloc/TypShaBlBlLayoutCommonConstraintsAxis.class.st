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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]
