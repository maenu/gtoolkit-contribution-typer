Class {
	#name : #TypPraExamples,
	#superclass : #Object,
	#instVars : [
		'thing'
	],
	#category : #'Typer-Pragma-Examples'
}

{ #category : #'as yet unclassified' }
TypPraExamples class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {Date typAsType};
		yourself
]

{ #category : #accessing }
TypPraExamples >> comment: aThing [
	<typTypeArgument: 1 as: 'String'>
	<typTypeResultAs: 'String'>
	| o c i s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new.	"typParameters Point"
	i := thing.	"thing is instance variable"
	s := self.
	d := (c select: [ :e | e abs > 1 ]) collect: [ :e | e abs ].
	o.
	c.
	i.
	s.
	^ c asString
]

{ #category : #accessing }
TypPraExamples >> example [
	<gtExample>
	TypMethodResolvers instance resolvers
		removeAll;
		add: TypPraMethodResolver new;
		add: TypStaMethodResolver new.
	TypVariableResolvers instance resolvers
		removeAll;
		add: TypPraVariableResolver new;
		add: TypStaVariableResolver new.
	^ self class methods
]

{ #category : #initialization }
TypPraExamples >> initialize [
	<typTypeVariable: #thing as: #Integer>
	super initialize
]
