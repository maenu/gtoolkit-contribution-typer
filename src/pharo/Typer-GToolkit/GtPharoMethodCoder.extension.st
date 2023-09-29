Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns [
	<gtAstCoderAddOns: 11>
	anAddOns addShortcut: TypGtPraTypeShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtPraType [

	| ast |
	ast := self rbAST.
	self sourceCode: (GtCoderExplicitSourceCode new source: (ast
				  typGtPraType;
				  formattedCode))
]
