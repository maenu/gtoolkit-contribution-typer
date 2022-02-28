Class {
	#name : #TypGtDeclarationStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtDeclarationStyler >> visitArgumentVariableNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitArgumentVariableNode: aNode
]

{ #category : #visiting }
TypGtDeclarationStyler >> visitMethodNode: aNode [

	| position type |
	type := TypInfMethodResolver instance
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
		with: { (TypGtAttribute type: type result) }
]

{ #category : #accessing }
TypGtDeclarationStyler >> visitTemporaryDeclarationNode: aNode [
	self styleNode: aNode.
	super visitTemporaryDeclarationNode: aNode
]
