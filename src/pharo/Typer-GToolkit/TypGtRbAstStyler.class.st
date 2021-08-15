Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtRBASTStyler,
	#traits : 'TRBProgramNodeVisitor - {#visitArgumentNodes:. #visitTemporaryDeclarationNode:}',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtRbAstStyler >> coder: aCoder [
	coder := aCoder
]

{ #category : #styling }
TypGtRbAstStyler >> style: aText ast: anAst [

	| ast |
	ast := coder rbAST.
	[ 
	TypInfSelf value: ast typGtSelf during: [ 
		ast typInfType.
		super style: aText ast: ast ] ]
		on: Error 
		do: [ :e | Halt once ]
]

{ #category : #private }
TypGtRbAstStyler >> styleFrom: from to: to with: attributes [
	(from <= text size and: [ to <= text size and: [ from <= to ] ])
		ifTrue: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [
	self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(TypGtAttribute new
				type_: aNode typInfType;
				yourself)}
]
