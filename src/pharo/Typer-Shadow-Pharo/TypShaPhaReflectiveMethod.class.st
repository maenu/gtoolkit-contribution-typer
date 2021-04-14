Class {
	#name : #TypShaPhaReflectiveMethod,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaReflectiveMethod class >> shadowedClass [
	^ ReflectiveMethod class
]

{ #category : #shadow }
TypShaPhaReflectiveMethod >> mCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]
