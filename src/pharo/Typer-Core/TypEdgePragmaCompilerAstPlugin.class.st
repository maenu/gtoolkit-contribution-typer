Class {
	#name : #TypEdgePragmaCompilerAstPlugin,
	#superclass : #OCCompilerASTPlugin,
	#category : #'Typer-Core-Type'
}

{ #category : #private }
TypEdgePragmaCompilerAstPlugin class >> priority [

	^ 3
]

{ #category : #api }
TypEdgePragmaCompilerAstPlugin >> transform [

	| rewriter |
	(ast hasPragmaNamed: #typEdge) ifFalse: [ ^ self ].
	ast := ast copy.
	rewriter := RBParseTreeRewriter new
		            replace: '| `@temporaries |
							  		(`.@asserts) `{ :node | node isMessage and: [ node receiver isSelf and: [ node selector = #assert: ] ] }.
							  		`.@statements.
							  		^ `@return'
		            with: '`.@asserts.
						 	   ^ self outgoingAt: (TypEdgePragmaData selector: thisContext selector arguments: thisContext arguments) ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
							 	`@return ]';
		            yourself.
	(rewriter executeTree: ast) ifFalse: [ 
		rewriter := RBParseTreeRewriter new
			            replace: '| `@temporaries |
							  		`.@statements.
							  		^ `@return'
			            with:
				            '^ self outgoingAt: (TypEdgePragmaData selector: thisContext selector arguments: thisContext arguments) ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
								`@return ]';
			            yourself.
		(rewriter executeTree: ast) ifFalse: [ 
			self error: 'invalid pattern' ] ].
	ast doSemanticAnalysis
]
