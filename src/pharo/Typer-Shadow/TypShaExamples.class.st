Class {
	#name : #TypShaExamples,
	#superclass : #Object,
	#category : #'Typer-Shadow-Examples'
}

{ #category : #accessing }
TypShaExamples >> pharo [
	<gtExample>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	TypChainableTypeResolvers reset resolvers
		add: TypShaTypeResolver new.
	TypChainableMethodResolvers reset resolvers
		add: TypShaMethodResolver new.
	TypChainableVariableResolvers reset resolvers
		add: TypShaVariableResolver new.
	^ self class methodNamed: #playground
]

{ #category : #accessing }
TypShaExamples >> playground [
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
