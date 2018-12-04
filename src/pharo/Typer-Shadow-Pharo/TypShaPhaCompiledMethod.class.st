Class {
	#name : #TypShaPhaCompiledMethod,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod class >> shadowedClass [
	^ CompiledMethod class
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> _numArgs [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> _pragmas [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {Pragma typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> typShaAsType: aClass [
	^ TypNamedType new
		name: aClass name;
		yourself
]
