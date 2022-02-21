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

	(ast hasPragmaNamed: #typEdge) ifTrue: [ 
		^ self transformOutgoingAtIfAbsentPut ].
	(ast hasPragmaNamed: #typEdgeOutgoingEnsure) ifTrue: [ 
		^ self typEdgeOutgoingAtEnsure ]
]

{ #category : #api }
TypEdgePragmaCompilerAstPlugin >> transformOutgoingAtIfAbsentPut [

	| rewriter |
	ast := ast copy.
	rewriter := RBParseTreeRewriter new
		            replace: '| `@temporaries |
							  		`.@statements.
							  		^ `@return'
		            with:
			            '^ self outgoingAt: (TypEdgePragmaData selector: thisContext selector arguments: thisContext arguments) ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
								`@return ]';
		            yourself.
	(rewriter executeTree: ast) ifFalse: [ self error: 'invalid pattern' ].
	ast doSemanticAnalysis
]

{ #category : #api }
TypEdgePragmaCompilerAstPlugin >> typEdgeOutgoingAtEnsure [

	| rewriter |
	ast := ast copy.
	rewriter := RBParseTreeRewriter new
		            replace: '| `@temporaries |
							  		`.@statements.
							  		^ `@return'
		            with: '| `@temporaries |
							 `.@statements.
							^ self outgoingAt: (TypEdgePragmaData selector: thisContext selector arguments: #()) ensure: (`@return)';
		            yourself.
	(rewriter executeTree: ast) ifFalse: [ self error: 'invalid pattern' ].
	ast doSemanticAnalysis
]
