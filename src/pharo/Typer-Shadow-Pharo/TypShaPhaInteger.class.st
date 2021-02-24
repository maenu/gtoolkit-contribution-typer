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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Character typAsType
]

{ #category : #shadow }
TypShaPhaInteger >> mAtRandom: aLookup [
	<typShaMethod: 'atRandom'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaInteger >> mBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]
