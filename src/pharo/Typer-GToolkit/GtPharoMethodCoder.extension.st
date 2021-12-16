Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns [
	"<gtAstCoderAddOns: 11>"
	anAddOns addShortcut: TypGtTypeWithPragmaShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtTypeWithPragma [

	| ast |
	ast := self rbAST.
	self sourceCode: (GtCoderExplicitSourceCode new source: (ast
				  typGtTypeWithPragma;
				  formattedCode))
]
