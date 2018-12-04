Class {
	#name : #TypShaPhaExamples,
	#superclass : #Object,
	#category : #'Typer-Shadow-Pharo-Examples'
}

{ #category : #accessing }
TypShaPhaExamples >> pharo [
	<gtExample>
	| tag |
	tag := #'Typer-Shadow-Pharo' asPackage classTagNamed: #Core.
	TypTypeResolvers instance resolvers
		removeAll;
		add: tag typShaAsTypeResolver.
	TypMethodResolvers instance resolvers
		removeAll;
		add: tag typShaAsMethodResolver.
	TypVariableResolvers instance resolvers
		removeAll;
		add: tag typShaAsVariableResolver.
	^ self class methodNamed: #playground
]

{ #category : #'as yet unclassified' }
TypShaPhaExamples >> playground [
	| o c i s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new.	"typParameters Point"
	s := self.
	d := (c select: [ :e | e abs > 1 ]) select: [ :e | e abs ].
	o.
	c.
	i.
	s
]
