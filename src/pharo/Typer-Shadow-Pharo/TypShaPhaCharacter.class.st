Class {
	#name : #TypShaPhaCharacter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaCharacter class >> mValue: aLookup [ 
	<typShaMethod: 'value:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCharacter class >> shadowedClass [
	^ Character class
]

{ #category : #shadow }
TypShaPhaCharacter >> mIsUppercase: aLookup [
	<typShaMethod: 'isUppercase'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
