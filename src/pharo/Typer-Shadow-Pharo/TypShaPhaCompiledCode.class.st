Class {
	#name : #TypShaPhaCompiledCode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledCode class >> shadowedClass [
	^ CompiledCode class
]

{ #category : #accessing }
TypShaPhaCompiledCode >> ___isPrimitive [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
