Class {
	#name : #TypEdgePragmaCompilerPlugin,
	#superclass : #OCStaticASTCompilerPlugin,
	#category : #'Typer-Core-Graph'
}

{ #category : #private }
TypEdgePragmaCompilerPlugin class >> priority [
	^ 3
]

{ #category : #api }
TypEdgePragmaCompilerPlugin >> transform [
	| rewriter |
	(ast hasPragmaNamed: #typEdge) ifFalse: [ ^ self ].
	ast := ast copy.
	rewriter := RBParseTreeRewriter new
			replace: '| `@temporaries |
							  		(`.@asserts) `{ :node | node isMessage and: [ node receiver isSelfVariable and: [ node selector = #assert: ] ] }.
							  		`.@statements.
							  		^ `@return'
				with: '`.@asserts.
						 	   ^ self outAt: (TypEdgePragmaKey selector: thisContext selector arguments: thisContext arguments) ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
							 	`@return ]';
			yourself.
	(rewriter executeTree: ast)
		ifFalse: [ rewriter := RBParseTreeRewriter new
					replace: '| `@temporaries |
							  		`.@statements.
							  		^ `@return'
						with: '^ self outAt: (TypEdgePragmaKey selector: thisContext selector arguments: thisContext arguments) ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
								`@return ]';
					yourself.
			(rewriter executeTree: ast) ifFalse: [ self error: 'invalid pattern' ] ].
	ast doSemanticAnalysis
]
