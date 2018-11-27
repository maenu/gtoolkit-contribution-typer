Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #private }
TypGtPharoCompletionStrategy >> actionsFor: anAST at: anInteger [
	| gtNode rbAst rbPosition rbNode |
	gtNode := self nodeFor: anInteger in: anAST.
	rbPosition := methodPattern source size + 1 + anInteger - gtNode source size.
	rbAst := RBParser parseFaultyMethod: methodPattern source , String cr , anAST source.
	rbAst methodNode
		compilationContext:
			(CompilationContext new
				class: (class ifNil: [ UndefinedObject ]);
				forSyntaxHighlighting: true;
				bindings: Dictionary new;
				requestor: nil).
	rbAst doSemanticAnalysis.
	rbNode := rbAst bestNodeFor: (rbPosition to: rbPosition).
	^ gtNode ifNil: [ #() ] ifNotNil: [ :node | node typGtCompletionActionsFor: self in: rbNode ]
]
