Class {
	#name : #TypGtDeclarationStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationStyler >> visitMethodNode: aNode [
	| nodes position |
	nodes := self context nodesAt: aNode.
	position := aNode arguments isEmpty
			ifTrue: [ aNode selector size ]
			ifFalse: [ aNode keywordsIntervals last stop ].
	super visitMethodNode: aNode.
	self
		attributes: {TypGtAttribute nodes: nodes}
		from: position
		to: position
]

{ #category : #accessing }
TypGtDeclarationStyler >> visitVariableNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitVariableNode: aNode
]
