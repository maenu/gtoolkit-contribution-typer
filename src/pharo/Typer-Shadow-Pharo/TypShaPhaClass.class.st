Class {
	#name : #TypShaPhaClass,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClass class >> shadowedClass [
	^ Class class
]

{ #category : #accessing }
TypShaPhaClass >> ___addClassVarNamed: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___classVarNamed: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___hasClassVarNamed: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___sharedPools [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Collection typAsType asParametricType: { Class typAsType } ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___subclass: _a instanceVariableNames: _b classVariableNames: _c package: _d [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription typAsType ];
		yourself
]
