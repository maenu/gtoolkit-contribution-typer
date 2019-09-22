Class {
	#name : #TypOldExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #example }
TypOldExamples >> example2 [
	<gtExample>
	self perform: #asString.
	^ self class lookupSelector: #example2
]

{ #category : #example }
TypOldExamples >> example2: x [
	<gtExample>
	<typTypeArgument: 1 as: 'Integer'>
	x
]

{ #category : #accessing }
TypOldExamples >> playground [
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
