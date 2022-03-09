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

	| position type |
	type := TypInfMethodResolver instance
		        typeAt: aNode
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
TypGtValueStyler >> visitVariableNode: aNode [

	self styleNode: aNode.
	super visitVariableNode: aNode
]
