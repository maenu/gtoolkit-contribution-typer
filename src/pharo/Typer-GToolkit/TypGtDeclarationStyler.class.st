Class {
	#name : #TypGtDeclarationStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationStyler >> visitMethodNode: aNode [
	| nodes position |
	super visitMethodNode: aNode.
	nodes := coderViewModel typGtContext nodesAt: aNode.
	nodes detect: [ :n | n type isUnknown not ] ifNone: [ ^ self ].
	position := aNode arguments
			ifEmpty: [ aNode keywordsIntervals last stop ]
			ifNotEmpty: [ :c | c last stop ].
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
