Extension { #name : 'GtPharoCompletionStrategy' }

{ #category : '*Typer-GToolkit' }
GtPharoCompletionStrategy >> typGtAsCompletionStrategy [

	| strategy |
	strategy := TypGtPharoCompletionStrategy new.
	(self class withAllSuperclasses flatCollect: #instVarNames) do: [ :e | 
		strategy instVarNamed: e put: (self instVarNamed: e) ].
	^ strategy
]
