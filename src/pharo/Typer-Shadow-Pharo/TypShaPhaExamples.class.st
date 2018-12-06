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
	TypTypeResolvers initializeGlobal resolvers add: tag typShaAsTypeResolver.
	TypMethodResolvers initializeGlobal resolvers add: tag typShaAsMethodResolver.
	TypVariableResolvers initializeGlobal resolvers add: tag typShaAsVariableResolver.
	^ self class methodNamed: #playground
]

{ #category : #accessing }
TypShaPhaExamples >> playground [
	| o c i s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new.	"typParameters Point"
	s := self.
	d := (c select: [ :e | e abs > 1 ]) collect: [ :e | 4 ].
	o.
	c.
	i.
	s
]
