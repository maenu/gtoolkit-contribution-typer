Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'coder',
		'typeContext'
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
	typeContext := ast typInfContextInSelf. 
	text := aText.   
	[  
	ast typInfTypeIn: typeContext.
	self visitNode: ast ]
		on: Error
		do: [ :e | Halt once ].
	text := nil.
	typeContext := nil
]

{ #category : #private }
TypGtRbAstStyler >> styleFrom: from to: to with: attributes [

	(from <= text size and: [ to <= text size and: [ from <= to ] ]) 
		ifTrue: [ text attributes: attributes from: from to: to ]
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [

	| data edge |
	data := TypEdgePragmaData selector: #type: arguments: { aNode }.
	edge := typeContext outgoing detect: [ :e | e data = data ].
	self
		styleFrom: aNode start
		to: aNode stop
		with: { (TypGtAttribute type: edge target object: edge) }
]
