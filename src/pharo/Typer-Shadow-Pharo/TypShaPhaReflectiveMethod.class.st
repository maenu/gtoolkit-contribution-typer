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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]
