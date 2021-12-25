Class {
	#name : #TypTypeCompilerAstPlugin,
	#superclass : #OCCompilerASTPlugin,
	#category : #'Typer-Core-Type'
}

{ #category : #private }
TypTypeCompilerAstPlugin class >> priority [

	^ 3
]

{ #category : #api }
TypTypeCompilerAstPlugin >> transform [

	(ast hasPragmaNamed: #typEdge) ifFalse: [ ^ self ].
	ast := RBParseTreeRewriter
		       replace: '| `@temporaries |
							  (`.@asserts) `{ :node | node isMessage and: [ node receiver isSelf and: [ node selector = #assert: ] ] }.
							  `.@statements.
							  ^ `@return'
		       with: '`.@asserts.
						  ^ self outgoingAt: {thisContext selector . thisContext arguments} ifAbsentPut: [ | `@temporaries |
						    `.@statements.
							 `@return ]'
		       in: ast copy.
	ast doSemanticAnalysis
]
