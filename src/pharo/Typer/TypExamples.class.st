Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	TypTypeResolvers initializeGlobal resolvers
		add: TypPraTypeResolver new;
		add: TypShaTypeResolvers new.
	TypMethodResolvers initializeGlobal resolvers
		add: TypPraMethodResolver new;
		add: TypShaMethodResolvers new.
	TypVariableResolvers initializeGlobal resolvers
		add: TypPraVariableResolver new;
		add: TypShaVariableResolvers new.
	^ self
]
