Class {
	#name : #TypShaGtGtCoderNegationFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderNegationFilter class >> shadowedClass [
	^ GtCoderNegationFilter class
]

{ #category : #accessing }
TypShaGtGtCoderNegationFilter >> ___originalFilter: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
