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
	| nodes position |
	nodes := TypInfMethodResolver instance
			nodesAt: aNode
			self: selfType
			super: selfType superOrNil.
	position := aNode arguments isEmpty
			ifTrue: [ aNode selector size ]
			ifFalse: [ aNode arguments last stop ].
	super visitMethodNode: aNode.
	self
		styleFrom: position
		to: position
		with: {TypGtAttribute
					nodes: nodes
					type: (nodes collect: [ :e | e type result ]) typAsType}
]

{ #category : #visiting }
TypGtValueStyler >> visitVariableNode: aNode [

	self styleNode: aNode.
	super visitVariableNode: aNode
]
