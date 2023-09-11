Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtValueStyler >> visitBlockNode: aNode [

	super visitBlockNode: aNode.
	self styleNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitMessageNode: aNode [

	super visitMessageNode: aNode.
	self styleNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitMethodNode: aNode [
	| nodes |
	nodes := self context nodesAt: aNode.
	super visitMethodNode: aNode.
	self
		attributes: {TypGtAttribute
					nodes: nodes
					type: (nodes collect: [ :e | e type result ]) typAsType}
		from: aNode stop
		to: aNode stop
]

{ #category : #visiting }
TypGtValueStyler >> visitVariableNode: aNode [

	self styleNode: aNode.
	super visitVariableNode: aNode
]
