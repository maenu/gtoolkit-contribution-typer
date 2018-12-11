Class {
	#name : #TypShaPhaExamples,
	#superclass : #Object,
	#category : #'Typer-Shadow-Examples'
}

{ #category : #accessing }
TypShaPhaExamples >> pharo [
	<gtExample>
	TypTypeResolvers initializeGlobal resolvers add: TypShaTypeResolvers new.
	TypMethodResolvers initializeGlobal resolvers add: TypShaMethodResolvers new.
	TypVariableResolvers initializeGlobal resolvers add: TypShaVariableResolvers new.
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
