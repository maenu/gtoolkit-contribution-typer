Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#instVars : [
		'___methods',
		'___methodCoders'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtMethodsCoder class >> ___forMethods: _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType asParametricType: {CompiledMethod typAsType} ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> ___announce: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Announcement typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
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
