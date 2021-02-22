Class {
	#name : #TypShaPhaInteger,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaInteger class >> shadowedClass [
	^ Integer class
]

{ #category : #shadow }
TypShaPhaInteger >> mAsCharacter: aLookup [
	<typShaMethod: 'asCharacter'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Character typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaInteger >> mAtRandom: aLookup [
	<typShaMethod: 'atRandom'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaInteger >> mBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]
