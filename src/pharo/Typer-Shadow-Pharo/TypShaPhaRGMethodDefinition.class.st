Class {
	#name : #TypShaPhaRGMethodDefinition,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRGMethodDefinition class >> shadowedClass [
	^ RGMethodDefinition class
]

{ #category : #accessing }
TypShaPhaRGMethodDefinition >> ___compiledMethod [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]
