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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___classVarNamed: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___hasClassVarNamed: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___sharedPools [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {Class typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___subclass: _a instanceVariableNames: _b classVariableNames: _c package: _d [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription typAsType ];
		yourself
]
