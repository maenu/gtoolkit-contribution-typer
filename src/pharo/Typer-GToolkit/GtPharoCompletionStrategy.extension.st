Extension { #name : #GtPharoCompletionStrategy }

{ #category : #'*Typer-GToolkit' }
GtPharoCompletionStrategy >> typGtAsCompletionStrategyIn: aCoder [
	"kind of a copy as subinstance"

	| strategy |
	strategy := TypGtPharoCompletionStrategy new
			coder: aCoder;
			yourself.
	(self class withAllSuperclasses flatCollect: #instVarNames)
		do: [ :e | strategy instVarNamed: e put: (self instVarNamed: e) ].
	^ strategy
]
