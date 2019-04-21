Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	TypTypeResolvers initializeGlobal resolvers
		add: TypPraTypeResolvers new;
		add: TypShaTypeResolvers new.
	TypMethodResolvers initializeGlobal resolvers
		add: TypPraMethodResolvers new;
		add: TypShaMethodResolvers new.
	TypVariableResolvers initializeGlobal resolvers
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
