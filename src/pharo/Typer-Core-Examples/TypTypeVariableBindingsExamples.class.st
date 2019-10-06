Class {
	#name : #TypTypeVariableBindingsExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #asserting }
TypTypeVariableBindingsExamples >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonEmpty [
	<gtExample>
	| empty variable variableBackwardReference nonVariableBackwardReference |
	empty := self empty.
	variable := self variable.
	variableBackwardReference := self variableBackwardReference.
	nonVariableBackwardReference := self nonVariableBackwardReference.
	self assert: [ (empty > empty) not ].
	self assert: [ (empty > variable) not ].
	self assert: [ (empty > variableBackwardReference) not ].
	self assert: [ (empty > nonVariableBackwardReference) not ].
	self assert: [ empty >= empty ].
	self assert: [ (empty >= variable) not ].
	self assert: [ (empty >= variableBackwardReference) not ].
	self assert: [ (empty >= nonVariableBackwardReference) not ].
	self assert: [ empty <= empty ].
	self assert: [ (empty <= variable) not ].
	self assert: [ (empty <= variableBackwardReference) not ].
	self assert: [ (empty <= nonVariableBackwardReference) not ].
	self assert: [ (empty < empty) not ].
	self assert: [ (empty < variable) not ].
	self assert: [ (empty < variableBackwardReference) not ].
	self assert: [ (empty < nonVariableBackwardReference) not ].
	^ empty
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonNonVariableBackwardReference [
	<gtExample>
	| empty variable variableBackwardReference nonVariableBackwardReference |
	empty := self empty.
	variable := self variable.
	variableBackwardReference := self variableBackwardReference.
	nonVariableBackwardReference := self nonVariableBackwardReference.
	self assert: [ (nonVariableBackwardReference > empty) not ].
	self assert: [ (nonVariableBackwardReference > variable) not ].
	self assert: [ (nonVariableBackwardReference > variableBackwardReference) not ].
	self assert: [ (nonVariableBackwardReference > nonVariableBackwardReference) not ].
	self assert: [ (nonVariableBackwardReference >= empty) not ].
	self assert: [ (nonVariableBackwardReference >= variable) not ].
	self assert: [ (nonVariableBackwardReference >= variableBackwardReference) not ].
	self assert: [ nonVariableBackwardReference >= nonVariableBackwardReference ].
	self assert: [ (nonVariableBackwardReference <= empty) not ].
	self assert: [ (nonVariableBackwardReference <= variable) not ].
	self assert: [ nonVariableBackwardReference <= variableBackwardReference ].
	self assert: [ nonVariableBackwardReference <= nonVariableBackwardReference ].
	self assert: [ (nonVariableBackwardReference < empty) not ].
	self assert: [ (nonVariableBackwardReference < variable) not ].
	self assert: [ nonVariableBackwardReference < variableBackwardReference ].
	self assert: [ (nonVariableBackwardReference < nonVariableBackwardReference) not ].
	^ nonVariableBackwardReference
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonVariable [
	<gtExample>
	| empty variable variableBackwardReference nonVariableBackwardReference |
	empty := self empty.
	variable := self variable.
	variableBackwardReference := self variableBackwardReference.
	nonVariableBackwardReference := self nonVariableBackwardReference.
	self assert: [ (variable > empty) not ].
	self assert: [ (variable > variable) not ].
	self assert: [ (variable > variableBackwardReference) not ].
	self assert: [ (variable > nonVariableBackwardReference) not ].
	self assert: [ (variable >= empty) not ].
	self assert: [ variable >= variable ].
	self assert: [ (variable >= variableBackwardReference) not ].
	self assert: [ (variable >= nonVariableBackwardReference) not ].
	self assert: [ (variable <= empty) not ].
	self assert: [ variable <= variable ].
	self assert: [ (variable <= variableBackwardReference) not ].
	self assert: [ (variable <= nonVariableBackwardReference) not ].
	self assert: [ (variable < empty) not ].
	self assert: [ (variable < variable) not ].
	self assert: [ (variable < variableBackwardReference) not ].
	self assert: [ (variable < nonVariableBackwardReference) not ].
	^ variable
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonVariableBackwardReference [
	<gtExample>
	| empty variable variableBackwardReference nonVariableBackwardReference |
	empty := self empty.
	variable := self variable.
	variableBackwardReference := self variableBackwardReference.
	nonVariableBackwardReference := self nonVariableBackwardReference.
	self assert: [ (variableBackwardReference > empty) not ].
	self assert: [ (variableBackwardReference > variable) not ].
	self assert: [ (variableBackwardReference > variableBackwardReference) not ].
	self assert: [ variableBackwardReference > nonVariableBackwardReference ].
	self assert: [ (variableBackwardReference >= empty) not ].
	self assert: [ (variableBackwardReference >= variable) not ].
	self assert: [ variableBackwardReference >= variableBackwardReference ].
	self assert: [ variableBackwardReference >= nonVariableBackwardReference ].
	self assert: [ (variableBackwardReference <= empty) not ].
	self assert: [ (variableBackwardReference <= variable) not ].
	self assert: [ variableBackwardReference <= variableBackwardReference ].
	self assert: [ (variableBackwardReference <= nonVariableBackwardReference) not ].
	self assert: [ (variableBackwardReference < empty) not ].
	self assert: [ (variableBackwardReference < variable) not ].
	self assert: [ (variableBackwardReference < variableBackwardReference) not ].
	self assert: [ (variableBackwardReference < nonVariableBackwardReference) not ].
	^ variableBackwardReference
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> empty [
	<gtExample>
	| bindings |
	bindings := TypTypeVariableBindings new.
	self assert: [ bindings isEmpty ].
	self assert: [ bindings isNotEmpty not ].
	self assert: [ bindings size = 0 ].
	^ bindings
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> equality [
	<gtExample>
	self assert: [ self empty = self empty ].
	self assert: [ self variable = self variable ].
	self
		assert: [ self variableBackwardReference = self variableBackwardReference ].
	self
		assert: [ self nonVariableBackwardReference
				= self nonVariableBackwardReference ].
	^ self empty
]

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> nonVariableBackwardReference [
	<gtExample>
	| bindings a b integer |
	bindings := self empty.
	a := self typeA.
	b := self typeB.
	integer := self typeInteger.
	bindings at: a put: integer.
	bindings at: b put: a.
	self assert: [ (bindings at: a) = integer ].
	self assert: [ (bindings at: b) = integer ].
	self
		assert: [ bindings variables
				=
					{a.
					b} asSet ].
	self assert: [ bindings isEmpty not ].
	self assert: [ bindings isNotEmpty ].
	self assert: [ bindings size = 2 ].
	^ bindings
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> typeA [
	^ '@A' typAsType
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> typeB [
	^ '@B' typAsType
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> typeInteger [
	^ 'Integer' typAsType
]

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> variable [
	<gtExample>
	| bindings a |
	bindings := self empty.
	a := self typeA.
	bindings at: a put: a.
	self assert: [ (bindings at: a) = a ].
	self assert: [ bindings variables = {a} asSet ].
	self assert: [ bindings isEmpty not ].
	self assert: [ bindings isNotEmpty ].
	self assert: [ bindings size = 1 ].
	^ bindings
]

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> variableBackwardReference [
	<gtExample>
	| bindings a b |
	bindings := self empty.
	a := self typeA.
	b := self typeB.
	bindings at: a put: a.
	bindings at: b put: a.
	self assert: [ (bindings at: a) = a ].
	self assert: [ (bindings at: b) = a ].
	self
		assert: [ bindings variables
				=
					{a.
					b} asSet ].
	self assert: [ bindings isEmpty not ].
	self assert: [ bindings isNotEmpty ].
	self assert: [ bindings size = 2 ].
	^ bindings
]

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> variableForwardReference [
	<gtExample>
	| bindings a b |
	bindings := self empty.
	a := self typeA.
	b := self typeB.
	self assert: [ bindings at: a put: b ] signals: AssertionFailure.
	self assert: [ bindings isEmpty ].
	self assert: [ bindings isNotEmpty not ].
	self assert: [ bindings size = 0 ].
	^ bindings
]
