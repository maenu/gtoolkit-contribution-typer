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

	| rewriter |
	(ast hasPragmaNamed: #typEdge) ifFalse: [ ^ self ].
	ast := ast copy.
	rewriter := RBParseTreeRewriter new
		            replace: '| `@temporaries |
							  		(`.@asserts) `{ :node | node isMessage and: [ node receiver isSelf and: [ node selector = #assert: ] ] }.
							  		`.@statements.
							  		^ `@return'
		            with: '`.@asserts.
						 	   ^ self outgoingAt: {thisContext selector . thisContext arguments} ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
							 	`@return ]';
		            yourself.
	(rewriter executeTree: ast) ifFalse: [ 
		rewriter := RBParseTreeRewriter new
			            replace: '| `@temporaries |
							  		`.@statements.
							  		^ `@return'
			            with:
				            '^ self outgoingAt: {thisContext selector . thisContext arguments} ifAbsentPut: [ | `@temporaries |
						    	`.@statements.
								`@return ]';
			            yourself.
		(rewriter executeTree: ast) ifFalse: [ 
			self error: 'invalid pattern' ] ].
	ast doSemanticAnalysis
]
