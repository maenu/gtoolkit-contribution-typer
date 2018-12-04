Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	| tag |
	tag := #'Typer-Shadow-Pharo' asPackage classTagNamed: #Core.
	TypTypeResolvers instance resolvers
		removeAll;
		add: tag typShaAsTypeResolver.
	TypMethodResolvers instance resolvers
		removeAll;
		add: TypPraMethodResolver new;
		add: tag typShaAsMethodResolver.
	TypVariableResolvers instance resolvers
		removeAll;
		add: TypPraVariableResolver new;
		add: tag typShaAsVariableResolver.
	^ self
]
