Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns [
	<gtAstCoderAddOns: 11>
	anAddOns addShortcut: TypGtTypeWithPragmaShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtTypeWithPragma [
	self
		sourceCode:
			(self rbAST
				typGtTypeWithPragma;
				formattedCode)
]
