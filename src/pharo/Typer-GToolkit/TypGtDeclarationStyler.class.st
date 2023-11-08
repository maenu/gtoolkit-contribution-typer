Class {
	#name : #TypGtDeclarationStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationStyler >> visitMethodNode: aNode [
	| nodes position |
	nodes := coderViewModel typGtContext nodesAt: aNode.
	position := aNode arguments
			ifEmpty: [ aNode keywordsIntervals last stop ]
			ifNotEmpty: [ :c | c last stop ].
	super visitMethodNode: aNode.
	self
		attributes: {TypGtTypeAttribute
					nodes: nodes
					type: (nodes collect: [ :e | e type result ]) typAsType}
		from: position
		to: position
]

{ #category : #accessing }
TypGtDeclarationStyler >> visitVariableNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitVariableNode: aNode
]
