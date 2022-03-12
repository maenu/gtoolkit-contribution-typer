Class {
	#name : #TypGtDeclarationStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtDeclarationStyler >> visitMethodNode: aNode [

	| node position |
	node := TypInfMethodResolver instance
		        nodeAt: aNode
		        self: selfType
		        super: selfType superOrNil.
	position := aNode arguments isEmpty
		            ifTrue: [ aNode selector size ]
		            ifFalse: [ aNode arguments last stop ].
	super visitMethodNode: aNode.
	self
		styleFrom: position
		to: position
		with: { (TypGtAttribute node: node type: node type result) }
]

{ #category : #accessing }
TypGtDeclarationStyler >> visitVariableNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitVariableNode: aNode
]
