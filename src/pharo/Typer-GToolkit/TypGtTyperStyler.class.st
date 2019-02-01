Class {
	#name : #TypGtTyperStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'worker',
		'coder'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTyperStyler >> coder [
	^ coder
]

{ #category : #accessing }
TypGtTyperStyler >> coder: anObject [
	coder := anObject
]

{ #category : #initialization }
TypGtTyperStyler >> initialize [
	super initialize.
	worker := TKTWorker new
		start;
		yourself
]

{ #category : #private }
TypGtTyperStyler >> style: aText ast: anAst [
	| string |
	anAst typIsTyped
		ifTrue: [ ^ self ].
	string := aText asString.
	worker
		schedule: [ 1 second wait.
			(coder source = string or: [ coder collapsedSource = string ])
				ifTrue: [ coder rbAST
						typTypeReset;
						typType.
					coder
						styleText;
						styleCollapsedText ] ]
		timeout: 5 seconds
]
