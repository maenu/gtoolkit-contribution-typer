Class {
	#name : #TypGtRbHighlighter,
	#superclass : #GtPharoCodeHighlighter,
	#instVars : [
		'node'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtRbHighlighter >> node [
	^ node
]

{ #category : #accessing }
TypGtRbHighlighter >> node: anObject [
	node := anObject
]

{ #category : #accessing }
TypGtRbHighlighter >> style: aText ast: theAst [
	| intervals |
	intervals := OrderedCollection new.
	coderViewModel typGtRbAst
		nodesDo: [ :n | n == node ifTrue: [ intervals add: (n start to: n stop) ] ].
	self style: aText intervals: intervals.
	^ aText
]
