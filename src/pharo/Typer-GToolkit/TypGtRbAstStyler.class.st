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
	[ ast typInfTypeSelf.
	self visitNode: ast ] on: Error do: [ :e | Transcript show: e stackString ].
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
	| nodes attribute stop |
	nodes := TypInfMethodResolver instance
			nodesAt: aNode
			self: selfType
			super: selfType superOrNil.	"type isUnknown ifTrue: [ ^ self ]."
	attribute := TypGtAttribute nodes: nodes.
	stop := aNode stop.
	(stop < text size and: [ (text at: stop + 1) = Character space ])
		ifTrue: [ attribute beReplace.
			stop := stop + 1 ].
	text
		attributes: {attribute}
		from: stop
		to: stop
]

{ #category : #visiting }
TypGtRbAstStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
