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
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeResultAs: 'String<Character>'>
	| i s x |
	i := thing.	"thing is instance variable"
	s := self.
	x := s comment: 'hello'.
	^ i asString
]

{ #category : #accessing }
TypPraExamples >> example [
	<gtExample>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	TypTypeResolvers initializeGlobal resolvers
		add: TypPraTypeResolver new.
	TypMethodResolvers initializeGlobal resolvers
		add: TypPraMethodResolver new.
	TypVariableResolvers initializeGlobal resolvers
		add: TypPraVariableResolver new.
	^ self class methodNamed: #comment:
]

{ #category : #initialization }
TypPraExamples >> initialize [
	<typTypeParametersAs: 'Date'>
	<typTypeVariable: 'thing' as: 'Integer'>
	super initialize
]
