Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	((TypTypeResolvers
		reset;
		instance) defaultResolver: TypInfTypeResolver new) resolvers
		add: TypPraTypeResolvers new;
		add: TypShaTypeResolvers new.
	((TypMethodResolvers
		reset;
		instance) defaultResolver: TypInfMethodResolver new) resolvers
		add: TypPraMethodResolvers new;
		add: TypShaMethodResolvers new.
	((TypVariableResolvers
		reset;
		instance) defaultResolver: TypInfVariableResolver new) resolvers
		add: TypPraVariableResolvers new;
		add: TypShaVariableResolvers new.
	^ self
]

{ #category : #example }
TypExamples >> example2 [
	<gtExample>
	self perform: #asString.
	^ self class lookupSelector: #example2
]

{ #category : #example }
TypExamples >> example2: x [
	<gtExample>
	<typTypeArgument: 1 as: 'Integer'>
	x
]
