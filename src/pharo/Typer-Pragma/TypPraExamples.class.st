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
	| i s x |
	i := thing.	"thing is instance variable"
	s := self.
	x := s comment: 'hello'.
	^ i asString
]

{ #category : #accessing }
TypPraExamples >> example [
	<gtExample>
	TypTypeResolvers instance resolvers
		removeAll;
		add: TypPraTypeResolver new.
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
	<typTypeParametersAs: 'Date'>
	<typTypeVariable: #thing as: #Integer>
	super initialize
]
