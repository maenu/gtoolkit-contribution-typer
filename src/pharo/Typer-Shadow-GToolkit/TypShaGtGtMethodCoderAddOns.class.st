Class {
	#name : #TypShaGtGtMethodCoderAddOns,
	#superclass : #TypShaShadow,
	#instVars : [
		'___stylers',
		'___modified'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns class >> shadowedClass [
	^ GtMethodCoderAddOns class
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___stylers [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {GtCoderBodyStyler typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> initialize [
	super initialize.
	___stylers := TypVariableResolver new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {GtCoderBodyStyler typAsType} ];
		yourself.
	___modified := TypVariableResolver new
		type: [ :a :s :r | Set typAsType asParametricType: {Symbol typAsType} ];
		yourself
]
