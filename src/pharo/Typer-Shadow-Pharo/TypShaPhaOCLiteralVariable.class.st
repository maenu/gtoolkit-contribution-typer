Class {
	#name : #TypShaPhaOCLiteralVariable,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable class >> shadowedClass [
	^ OCLiteralVariable class
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> _isClassVariable [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> _isFromSharedPool [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> _isGlobalClassNameBinding [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable >> _isGlobalVariable [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]
