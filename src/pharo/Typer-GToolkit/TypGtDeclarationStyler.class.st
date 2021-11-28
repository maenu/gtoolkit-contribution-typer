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

	| position |
	position := aNode arguments isEmpty
		            ifTrue: [ aNode selector size ]
		            ifFalse: [ aNode arguments last stop ].
	super visitMethodNode: aNode.
	self styleFrom: position to: position with: { (TypGtAttribute new
			 type_: aNode typInfType result;
			 yourself) }
]

{ #category : #accessing }
TypGtDeclarationStyler >> visitTemporaryDeclarationNode: aNode [
	self styleNode: aNode.
	super visitTemporaryDeclarationNode: aNode
]
