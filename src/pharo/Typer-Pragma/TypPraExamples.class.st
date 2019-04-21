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
	TypChainableTypeResolvers reset resolvers
		add: TypPraTypeResolver new.
	TypChainableMethodResolvers reset resolvers
		add: TypPraMethodResolver new.
	TypChainableVariableResolvers reset resolvers
		add: TypPraVariableResolver new.
	^ self class methodNamed: #comment:
]

{ #category : #initialization }
TypPraExamples >> initialize [
	<typTypeParametersAs: 'Date'>
	<typTypeVariable: 'thing' as: 'Integer'>
	super initialize
]
