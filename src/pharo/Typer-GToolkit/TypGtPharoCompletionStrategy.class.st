Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#category : #'Typer-GToolkit'
}

{ #category : #private }
TypGtPharoCompletionStrategy >> actionsFor: anAST at: anInteger [
	| gtNode rbAst rbPosition rbNode |
	gtNode := self nodeFor: anInteger in: anAST.
	rbPosition := methodPattern source size + 1 + anInteger - gtNode source size.
	rbAst := RBParser parseFaultyMethod: methodPattern source , String cr , anAST source.
	rbAst doSemanticAnalysis.
	rbNode := rbAst bestNodeFor: (rbPosition to: rbPosition).
	^ gtNode ifNil: [ #() ] ifNotNil: [ :node | node typGtCompletionActionsFor: self in: rbNode ]
]
