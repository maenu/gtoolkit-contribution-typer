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
		type: super typAsType;
		parameters: {Date typAsType};
		yourself
]

{ #category : #accessing }
TypPraExamples >> comment: aThing [
	<typTypeArgument: 1 as: 'String'>
	<typTypeResultAs: 'String'>
	| o c i s |
	o := Object new.
	c := OrderedCollection new.	"typParameters Point"
	i := thing.	"thing is instance variable"
	s := self.
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
