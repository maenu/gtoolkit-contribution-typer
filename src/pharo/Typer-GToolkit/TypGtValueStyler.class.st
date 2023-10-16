Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtValueStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
	self styleNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitMessageNode: aNode [
	| nodes |
	super visitMessageNode: aNode.
	nodes := context nodesAt: aNode.
	self
		attributes: {TypGtFunctionResultAttribute
					nodes: nodes
					type: (nodes collect: #asFunction) typAsMinimizedType}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtValueStyler >> visitMethodNode: aNode [
	| position nodes |
	super visitMethodNode: aNode.
	position := aNode arguments
			ifEmpty: [ aNode keywordsIntervals last stop ]
			ifNotEmpty: [ :c | c last stop ].
	nodes := context nodesAt: aNode.
	self
		attributes: {TypGtFunctionResultAttribute
					nodes: nodes
					type: (nodes collect: #asFunction) typAsMinimizedType}
		from: position
		to: position
]

{ #category : #visiting }
TypGtValueStyler >> visitVariableNode: aNode [
	self styleNode: aNode.
	super visitVariableNode: aNode
]
