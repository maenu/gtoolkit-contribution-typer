Class {
	#name : #TypGtPharoCompletionStrategy,
	#superclass : #GtPharoCompletionStrategy,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #private }
TypGtPharoCompletionStrategy >> actionsFor: anAST at: anInteger [
	| gtNode rbAst rbPosition rbNode |
	gtNode := self nodeFor: anInteger in: anAST.
	rbPosition := anInteger - gtNode source size.
	rbAst := RBParser parseFaultyMethod: anAST source.
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

{ #category : #'private-selector' }
TypGtPharoCompletionStrategy >> selectorsForReceiver: aBehavior matching: aString [
	| tree |
	tree := aBehavior notNil
		ifTrue: [ tree := GtPrefixTree new.
			aBehavior withAllSuperclasses withIndexDo: [ :e :i | e selectors do: [ :f | tree add: f weight: 999 - i "this is an incredible stupid trick to get an inverse order while being above zero, which is apparently required. never do 999 superclasses" ] ].
			tree ]
		ifFalse: [ SelectorCache ].
	^ tree weightedFirst: maxItems startingWith: aString
]
