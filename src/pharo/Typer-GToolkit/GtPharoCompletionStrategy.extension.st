Extension { #name : #GtPharoCompletionStrategy }

{ #category : #'*Typer-GToolkit' }
GtPharoCompletionStrategy >> typGtAsTypGtPharoCompletionStrategyFor: aCoder [
	| strategy |
	strategy := TypGtPharoCompletionStrategy new
		coder: aCoder;
		yourself.
	(self class withAllSuperclasses flatCollect: #instVarNames)
		do: [ :e | strategy instVarNamed: e put: (self instVarNamed: e) ].
	^ strategy
]
