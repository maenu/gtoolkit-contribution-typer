Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'coder',
		'selfType'
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
	selfType := ast methodClass typAsType.
	text := aText.
	[ 
	ast typInfTypeSelf: selfType.
	self visitNode: ast ]
		on: Error
		do: [ :e | Halt once ].
	text := nil.
	selfType := nil
]

{ #category : #private }
TypGtRbAstStyler >> styleFrom: from to: to with: attributes [

	(from <= text size and: [ to <= text size and: [ from <= to ] ]) 
		ifTrue: [ text attributes: attributes from: from to: to ]
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [

	| type |
	type := TypInfMethodResolver instance
		        nodeAt: aNode
		        self: selfType
		        super: selfType superOrNil.
	self
		styleFrom: aNode start
		to: aNode stop
		with: { (TypGtAttribute type: type) }
]
