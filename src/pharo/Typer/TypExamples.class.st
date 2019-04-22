Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	(TypChainableTypeResolvers
		reset;
		instance)
		next: (TypChainableTypeResolvers new add: TypCachingTypeResolver typInfResolver);
		add: TypCachingTypeResolver typPraResolver;
		add: TypCachingTypeResolver typShaResolver.
	(TypChainableMethodResolvers
		reset;
		instance)
		next: (TypChainableMethodResolvers new add: TypCachingMethodResolver typInfResolver);
		add: TypCachingMethodResolver typPraResolver;
		add: TypCachingMethodResolver typShaResolver.
	(TypChainableVariableResolvers
		reset;
		instance)
		next: (TypChainableVariableResolvers new add: TypCachingVariableResolver typInfResolver);
		add: TypCachingVariableResolver typPraResolver;
		add: TypCachingVariableResolver typShaResolver.
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

{ #category : #accessing }
TypExamples >> playground [
	| o c s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new "typParameters Point".
	s := self.
	d := (c select: [ :e | e abs > 1 ]) collect: [ :e | 4 ].
	o.
	c.
	s
]
