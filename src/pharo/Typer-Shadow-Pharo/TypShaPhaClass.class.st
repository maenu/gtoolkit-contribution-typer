Class {
	#name : #TypShaPhaClass,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaClass class >> shadowedClass [
	^ Class class
]

{ #category : #accessing }
TypShaPhaClass >> ___sharedPools [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Collection typAsType asParametricType: { Class typAsType } ];
		yourself
]

{ #category : #accessing }
TypShaPhaClass >> ___whichClassDefinesClassVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]
