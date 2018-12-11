Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#instVars : [
		'___methods',
		'___methodCoders'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> initialize [
	super initialize.
	___methods := TypVariableResolver new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {CompiledMethod typAsType} ];
		yourself.
	___methodCoders := TypVariableResolver new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {GtMethodCoder typAsType} ];
		yourself
]
