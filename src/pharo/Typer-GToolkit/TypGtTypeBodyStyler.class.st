Class {
	#name : #TypGtTypeBodyStyler,
	#superclass : #GtRBASTStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtTypeBodyStyler >> coder: aCoder [
	coder := aCoder
]

{ #category : #styling }
TypGtTypeBodyStyler >> style: aText ast: anAst [
	| ast |
	ast := coder rbAST.
	[ ast isMethod
		ifTrue: [ TypInfSelf
				value: ast compiledMethod methodClass typAsType
				during: [ ast typInfType.
					super style: aText ast: ast ] ]
		ifFalse: [ ast typInfType.
			super style: aText ast: ast ] ]
		on: Error
		do: [ :e | Halt once ]
]

{ #category : #private }
TypGtTypeBodyStyler >> styleFrom: from to: to with: attributes [
	(from <= text size and: [ to <= text size ])
		ifTrue: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
TypGtTypeBodyStyler >> styleValueNode: aNode [
	self
		styleFrom: aNode start
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
