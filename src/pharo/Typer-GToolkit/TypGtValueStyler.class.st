Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtValueStyler >> attributes: anAttributesCollection from: aStart to: anEnd [
	^ super
		attributes: anAttributesCollection
		from: aStart - self offset
		to: anEnd - self offset
]

{ #category : #accessing }
TypGtValueStyler >> offset [
	self context node isMethod ifTrue: [ ^ 0 ].
	^ self context node body start - 1
]

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
