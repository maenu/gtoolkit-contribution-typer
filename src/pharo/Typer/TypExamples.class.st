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
	TypTypeResolvers initializeGlobal resolvers
		add: TypPraTypeResolver new;
		add: tag typShaAsTypeResolver.
	TypMethodResolvers initializeGlobal resolvers
		add: TypPraMethodResolver new;
		add: tag typShaAsMethodResolver.
	TypVariableResolvers initializeGlobal resolvers
		add: TypPraVariableResolver new;
		add: tag typShaAsVariableResolver.
	^ self
]
