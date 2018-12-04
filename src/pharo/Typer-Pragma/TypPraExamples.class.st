Class {
	#name : #TypPraExamples,
	#superclass : #Object,
	#instVars : [
		'thing'
	],
	#category : #'Typer-Pragma-Examples'
}

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
	d := (c select: [ :e | e abs > 1 ]) select: [ :e | e abs ].
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
		add: TypPraMethodResolver new.
	TypVariableResolvers instance resolvers
		removeAll;
		add: TypPraVariableResolver new.
	^ self class methodNamed: #comment:
]

{ #category : #initialization }
TypPraExamples >> initialize [
	<typTypeVariable: #thing as: #Integer>
	super initialize
]
