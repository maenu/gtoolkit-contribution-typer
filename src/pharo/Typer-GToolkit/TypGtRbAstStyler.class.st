Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Typer-GToolkit'
}

{ #category : #styling }
TypGtRbAstStyler >> context [
	| model |
	model := self coderViewModel coderModel.
	^ model
		attributeNamed: #typGtContext
		ifAbsent: [  "happens for fresh method coder"
			model
				attributeNamed: #typGtContext
				put: (TypInfMethodResolver instance
						contextAt: model compiledMethod ast
						self: model behavior typAsType
						super: model behavior typAsType superOrNil) ]
]

{ #category : #styling }
TypGtRbAstStyler >> style: aText ast: anAst [
	text := aText.
	[ self visitNode: self context node ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [
	| nodes attribute stop |
	nodes := self context nodesAt: aNode.	"type isUnknown ifTrue: [ ^ self ]."
	attribute := TypGtAttribute nodes: nodes.
	stop := aNode stop.
	(stop < text size and: [ (text at: stop + 1) = Character space ])
		ifTrue: [ attribute beReplace.
			stop := stop + 1 ].
	self
		attributes: {attribute}
		from: stop
		to: stop
]

{ #category : #visiting }
TypGtRbAstStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
