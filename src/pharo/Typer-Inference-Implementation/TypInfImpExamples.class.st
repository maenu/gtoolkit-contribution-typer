Class {
	#name : #TypInfImpExamples,
	#superclass : #Object,
	#category : #'Typer-Inference-Implementation-Examples'
}

{ #category : #accessing }
TypInfImpExamples >> pharo [
	<gtExample>
	TypMethodResolvers instance resolvers
		removeAll;
		add: TypInfImpMethodResolver new.
	TypVariableResolvers instance resolvers
		removeAll;
		add: TypInfImpVariableResolver new.
	^ self class methodNamed: #playground
]

{ #category : #accessing }
TypInfImpExamples >> playground [
	| o c i s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new.	"typParameters Point"
	s := self playground.
	d := (c select: [ :e | e abs > 1 ]) collect: [ :e | 4 ].
	o.
	c.
	i.
	s
]
