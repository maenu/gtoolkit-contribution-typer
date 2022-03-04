Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtValueStyler >> visitArgumentNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitArgumentNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitArgumentVariableNode: aNode [

	aNode isDefinition ifTrue: [ self styleNode: aNode ].
	super visitArgumentVariableNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitMethodNode: aNode [

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

{ #category : #visiting }
TypGtValueStyler >> visitNode: aNode [

	super visitNode: aNode.
	self styleNode: aNode
]

{ #category : #visiting }
TypGtValueStyler >> visitTemporaryDeclarationNode: aNode [

	self styleNode: aNode.
	super visitTemporaryDeclarationNode: aNode
]
