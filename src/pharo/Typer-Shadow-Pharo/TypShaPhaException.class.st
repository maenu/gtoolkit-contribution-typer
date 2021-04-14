Class {
	#name : #TypShaPhaException,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaException class >> mSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: #()
		argumentsOptional: false
		signalsAlways: true
]

{ #category : #'as yet unclassified' }
TypShaPhaException class >> shadowedClass [
	^ Exception class
]
