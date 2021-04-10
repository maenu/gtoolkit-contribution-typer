Class {
	#name : #TypGtTypeDeclarationBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtTypeDeclarationBodyStyler >> visitArgumentNode: aNode [
	(aNode parent isBlock
		or: [ aNode parent isSequence or: [ aNode parent isMethod ] ])
		ifTrue: [ self styleValueNode: aNode ].
	super visitArgumentNode: aNode
]

{ #category : #visiting }
TypGtTypeDeclarationBodyStyler >> visitMethodNode: aNode [
	| position |
	position := aNode arguments isEmpty
		ifTrue: [ aNode selector size ]
		ifFalse: [ aNode arguments last stop ].
	self
		styleFrom: position
		to: position
		with:
			{(TypGtTypeAttribute new
				type_: aNode typInfType result;
				yourself)}.
	super visitMethodNode: aNode
]
