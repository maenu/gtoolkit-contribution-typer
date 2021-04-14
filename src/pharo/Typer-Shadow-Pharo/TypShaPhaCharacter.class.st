Class {
	#name : #TypShaPhaCharacter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaCharacter class >> mValue: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'as yet unclassified' }
TypShaPhaCharacter class >> shadowedClass [
	^ Character class
]

{ #category : #shadow }
TypShaPhaCharacter >> mIsUppercase: aLookup [
	<typShaMethod: 'isUppercase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
