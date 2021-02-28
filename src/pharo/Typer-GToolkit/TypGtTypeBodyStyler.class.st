Class {
	#name : #TypGtTypeBodyStyler,
	#superclass : #GtASTStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #styling }
TypGtTypeBodyStyler >> style: aText ast: anAst [
	text := aText.
	anAst typInfType.
	super style: aText ast: anAst
]

{ #category : #private }
TypGtTypeBodyStyler >> styleFrom: from to: to with: attributes [
	(from <= text size and: [ to <= text size ])
		ifTrue: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
TypGtTypeBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				type_: aNode typInfType;
				yourself)}
]

{ #category : #visiting }
TypGtTypeBodyStyler >> visitPragmaNode: aNode [
	"Avoid annotating pragma arguments by empty implementation."

	
]
