Class {
	#name : #TypGtTyperStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'coder'
	],
	#classInstVars : [
		'pool'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #finalization }
TypGtTyperStyler class >> finalize [
	pool stop.
	super finalize
]

{ #category : #'class initialization' }
TypGtTyperStyler class >> initialize [
	pool := TKTCommonQueueWorkerPool new
		poolMaxSize: 5;
		start;
		yourself
]

{ #category : #accessing }
TypGtTyperStyler class >> pool [
	^ pool
]

{ #category : #accessing }
TypGtTyperStyler >> coder [
	^ coder
]

{ #category : #accessing }
TypGtTyperStyler >> coder: anObject [
	coder := anObject
]

{ #category : #private }
TypGtTyperStyler >> style: aText ast: anAst [
	self flag: 'handle timeout?'.
	anAst typIsTyped
		ifTrue: [ ^ self ].
	self class pool
		schedule: [ coder rbAST typType.
			coder styleText ]
		"timeout: 5 seconds"
]
