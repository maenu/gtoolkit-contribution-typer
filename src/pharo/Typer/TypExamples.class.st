Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	((TypChainableTypeResolvers
		reset;
		instance)
		next: (TypChainableTypeResolvers new add: TypInfTypeResolver new))
		add: TypPraTypeResolver new;
		add: TypShaTypeResolver new.
	((TypChainableMethodResolvers
		reset;
		instance)
		next: (TypChainableTypeResolvers new add: TypInfMethodResolver new))
		add: TypPraMethodResolver new;
		add: TypShaMethodResolver new.
	((TypChainableVariableResolvers
		reset;
		instance)
		next: (TypChainableTypeResolvers new add: TypInfVariableResolver new))
		add: TypPraVariableResolver new;
		add: TypShaVariableResolver new.
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
