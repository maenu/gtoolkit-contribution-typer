Class {
	#name : #TypShaPhaException,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaException class >> shadowedClass [
	^ Exception class
]

{ #category : #shadow }
TypShaPhaException >> mSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver copy
		arguments: #()
		argumentsOptional: false
		signalsAlways: true
]
