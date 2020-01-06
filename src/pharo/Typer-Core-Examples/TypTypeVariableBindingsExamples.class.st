Class {
	#name : #TypTypeVariableBindingsExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-OLD-Type'
}

{ #category : #accessing }
TypTypeVariableBindingsExamples >> asCompatibleWithBindNonVariableBackward [
	<gtExample>
	self
		assert: [ self bindNonVariableBackward asCompatibleWith: self empty ]
		signals: AssertionFailure.
	self
		assert: [ self bindNonVariableBackward asCompatibleWith: self bindVariable ]
		signals: AssertionFailure.
	self
		assert: [ (self bindNonVariableBackward
				asCompatibleWith: self bindVariableBackward)
				= self bindVariableBackward ].
	self
		assert: [ (self bindNonVariableBackward
				asCompatibleWith: self bindNonVariableBackward)
				= self bindNonVariableBackward ].
	^ self bindNonVariableBackward
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> asCompatibleWithBindVariable [
	<gtExample>
	self
		assert: [ self bindVariable asCompatibleWith: self empty ]
		signals: AssertionFailure.
	self
		assert: [ (self bindVariable asCompatibleWith: self bindVariable)
				= self bindVariable ].
	self
		assert: [ self bindVariable asCompatibleWith: self bindVariableBackward ]
		signals: AssertionFailure.
	self
		assert: [ self bindVariable asCompatibleWith: self bindNonVariableBackward ]
		signals: AssertionFailure.
	^ self bindVariable
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> asCompatibleWithBindVariableBackward [
	<gtExample>
	self
		assert: [ self bindVariableBackward asCompatibleWith: self empty ]
		signals: AssertionFailure.
	self
		assert: [ self bindVariableBackward asCompatibleWith: self bindVariable ]
		signals: AssertionFailure.
	self
		assert: [ (self bindVariableBackward
				asCompatibleWith: self bindVariableBackward)
				= self bindVariableBackward ].
	self
		assert: [ (self bindVariableBackward
				asCompatibleWith: self bindNonVariableBackward)
				= self bindVariableBackward ].
	^ self bindVariableBackward
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> asCompatibleWithEmpty [
	<gtExample>
	self
		assert: [ (self empty asCompatibleWith: self empty) = self empty ].
	self
		assert: [ self empty asCompatibleWith: self bindVariable ]
		signals: AssertionFailure.
	self
		assert: [ self empty asCompatibleWith: self bindVariableBackward ]
		signals: AssertionFailure.
	self
		assert: [ self empty asCompatibleWith: self bindNonVariableBackward ]
		signals: AssertionFailure.
	^ self empty
]

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> bindNonVariableBackward [
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

{ #category : #'as yet unclassified' }
TypTypeVariableBindingsExamples >> bindVariable [
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
TypTypeVariableBindingsExamples >> bindVariableBackward [
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
TypTypeVariableBindingsExamples >> bindVariableForward [
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

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonEmpty [
	<gtExample>
	| empty bindVariable bindVariableBackward bindNonVariableBackward |
	empty := self empty.
	bindVariable := self bindVariable.
	bindVariableBackward := self bindVariableBackward.
	bindNonVariableBackward := self bindNonVariableBackward.
	self assert: [ (empty > empty) not ].
	self assert: [ (empty > bindVariable) not ].
	self assert: [ (empty > bindVariableBackward) not ].
	self assert: [ (empty > bindNonVariableBackward) not ].
	self assert: [ empty >= empty ].
	self assert: [ (empty >= bindVariable) not ].
	self assert: [ (empty >= bindVariableBackward) not ].
	self assert: [ (empty >= bindNonVariableBackward) not ].
	self assert: [ empty = self empty ].
	self assert: [ (empty = bindVariable) not ].
	self assert: [ (empty = bindVariableBackward) not ].
	self assert: [ (empty = bindNonVariableBackward) not ].
	self assert: [ empty <= empty ].
	self assert: [ (empty <= bindVariable) not ].
	self assert: [ (empty <= bindVariableBackward) not ].
	self assert: [ (empty <= bindNonVariableBackward) not ].
	self assert: [ (empty < empty) not ].
	self assert: [ (empty < bindVariable) not ].
	self assert: [ (empty < bindVariableBackward) not ].
	self assert: [ (empty < bindNonVariableBackward) not ].
	^ empty
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonNonVariableBackwardReference [
	<gtExample>
	| empty bindVariable bindVariableBackward bindNonVariableBackward |
	empty := self empty.
	bindVariable := self bindVariable.
	bindVariableBackward := self bindVariableBackward.
	bindNonVariableBackward := self bindNonVariableBackward.
	self assert: [ (bindNonVariableBackward > empty) not ].
	self assert: [ (bindNonVariableBackward > bindVariable) not ].
	self assert: [ (bindNonVariableBackward > bindVariableBackward) not ].
	self assert: [ (bindNonVariableBackward > bindNonVariableBackward) not ].
	self assert: [ (bindNonVariableBackward >= empty) not ].
	self assert: [ (bindNonVariableBackward >= bindVariable) not ].
	self assert: [ (bindNonVariableBackward >= bindVariableBackward) not ].
	self assert: [ bindNonVariableBackward >= bindNonVariableBackward ].
	self assert: [ (bindNonVariableBackward = empty) not ].
	self assert: [ (bindNonVariableBackward = bindVariable) not ].
	self assert: [ (bindNonVariableBackward = bindVariableBackward) not ].
	self assert: [ bindNonVariableBackward = self bindNonVariableBackward ].
	self assert: [ (bindNonVariableBackward <= empty) not ].
	self assert: [ (bindNonVariableBackward <= bindVariable) not ].
	self assert: [ bindNonVariableBackward <= bindVariableBackward ].
	self assert: [ bindNonVariableBackward <= bindNonVariableBackward ].
	self assert: [ (bindNonVariableBackward < empty) not ].
	self assert: [ (bindNonVariableBackward < bindVariable) not ].
	self assert: [ bindNonVariableBackward < bindVariableBackward ].
	self assert: [ (bindNonVariableBackward < bindNonVariableBackward) not ].
	^ bindNonVariableBackward
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonVariable [
	<gtExample>
	| empty bindVariable bindVariableBackward bindNonVariableBackward |
	empty := self empty.
	bindVariable := self bindVariable.
	bindVariableBackward := self bindVariableBackward.
	bindNonVariableBackward := self bindNonVariableBackward.
	self assert: [ (bindVariable > empty) not ].
	self assert: [ (bindVariable > bindVariable) not ].
	self assert: [ (bindVariable > bindVariableBackward) not ].
	self assert: [ (bindVariable > bindNonVariableBackward) not ].
	self assert: [ (bindVariable >= empty) not ].
	self assert: [ bindVariable >= bindVariable ].
	self assert: [ (bindVariable >= bindVariableBackward) not ].
	self assert: [ (bindVariable >= bindNonVariableBackward) not ].
	self assert: [ (bindVariable = empty) not ].
	self assert: [ bindVariable = self bindVariable ].
	self assert: [ (bindVariable = bindVariableBackward) not ].
	self assert: [ (bindVariable = bindNonVariableBackward) not ].
	self assert: [ (bindVariable <= empty) not ].
	self assert: [ bindVariable <= bindVariable ].
	self assert: [ (bindVariable <= bindVariableBackward) not ].
	self assert: [ (bindVariable <= bindNonVariableBackward) not ].
	self assert: [ (bindVariable < empty) not ].
	self assert: [ (bindVariable < bindVariable) not ].
	self assert: [ (bindVariable < bindVariableBackward) not ].
	self assert: [ (bindVariable < bindNonVariableBackward) not ].
	^ bindVariable
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> comparisonVariableBackwardReference [
	<gtExample>
	| empty bindVariable bindVariableBackward bindNonVariableBackward |
	empty := self empty.
	bindVariable := self bindVariable.
	bindVariableBackward := self bindVariableBackward.
	bindNonVariableBackward := self bindNonVariableBackward.
	self assert: [ (bindVariableBackward > empty) not ].
	self assert: [ (bindVariableBackward > bindVariable) not ].
	self assert: [ (bindVariableBackward > bindVariableBackward) not ].
	self assert: [ bindVariableBackward > bindNonVariableBackward ].
	self assert: [ (bindVariableBackward >= empty) not ].
	self assert: [ (bindVariableBackward >= bindVariable) not ].
	self assert: [ bindVariableBackward >= bindVariableBackward ].
	self assert: [ bindVariableBackward >= bindNonVariableBackward ].
	self assert: [ (bindVariableBackward = empty) not ].
	self assert: [ (bindVariableBackward = bindVariable) not ].
	self assert: [ bindVariableBackward = self bindVariableBackward ].
	self assert: [ (bindVariableBackward = bindNonVariableBackward) not ].
	self assert: [ (bindVariableBackward <= empty) not ].
	self assert: [ (bindVariableBackward <= bindVariable) not ].
	self assert: [ bindVariableBackward <= bindVariableBackward ].
	self assert: [ (bindVariableBackward <= bindNonVariableBackward) not ].
	self assert: [ (bindVariableBackward < empty) not ].
	self assert: [ (bindVariableBackward < bindVariable) not ].
	self assert: [ (bindVariableBackward < bindVariableBackward) not ].
	self assert: [ (bindVariableBackward < bindNonVariableBackward) not ].
	^ bindVariableBackward
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> copyBindNonVariableBackward [
	<gtExample>
	| bindNonVariableBackward copy c |
	bindNonVariableBackward := self bindNonVariableBackward.
	copy := bindNonVariableBackward copy.
	c := self typeC.
	self assert: [ bindNonVariableBackward = copy ].
	self assert: [ bindNonVariableBackward ~~ copy ].
	copy at: c put: c.
	self assert: [ bindNonVariableBackward ~= copy ].
	^ copy
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> copyBindVariable [
	<gtExample>
	| bindVariable copy c |
	bindVariable := self bindVariable.
	copy := bindVariable copy.
	c := self typeC.
	self assert: [ bindVariable = copy ].
	self assert: [ bindVariable ~~ copy ].
	copy at: c put: c.
	self assert: [ bindVariable ~= copy ].
	^ copy
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> copyBindVariableBackward [
	<gtExample>
	| bindVariableBackward copy c |
	bindVariableBackward := self bindVariableBackward.
	copy := bindVariableBackward copy.
	c := self typeC.
	self assert: [ bindVariableBackward = copy ].
	self assert: [ bindVariableBackward ~~ copy ].
	copy at: c put: c.
	self assert: [ bindVariableBackward ~= copy ].
	^ copy
]

{ #category : #accessing }
TypTypeVariableBindingsExamples >> copyEmpty [
	<gtExample>
	| empty copy c |
	empty := self empty.
	copy := empty copy.
	c := self typeC.
	self assert: [ empty = copy ].
	self assert: [ empty ~~ copy ].
	copy at: c put: c.
	self assert: [ empty ~= copy ].
	^ copy
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> empty [
	<gtExample>
	| bindings |
	self flag: 'TODO remove and replace'.
	bindings := Dictionary new.
	self assert: [ bindings isEmpty ].
	self assert: [ bindings isNotEmpty not ].
	self assert: [ bindings size = 0 ].
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
TypTypeVariableBindingsExamples >> typeC [
	^ '@C' typAsType
]

{ #category : #requirements }
TypTypeVariableBindingsExamples >> typeInteger [
	^ 'Integer' typAsType
]
