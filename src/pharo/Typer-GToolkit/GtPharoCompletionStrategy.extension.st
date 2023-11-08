Extension { #name : #GtPharoCompletionStrategy }

{ #category : #'*Typer-GToolkit' }
GtPharoCompletionStrategy >> typGtAsCompletionStrategyIn: aCoderViewModel [
	"kind of a copy as subinstance"

	| strategy |
	strategy := TypGtPharoCompletionStrategy new
			coderViewModel: aCoderViewModel;
			yourself.
	(self class withAllSuperclasses flatCollect: #instVarNames)
		do: [ :e | strategy instVarNamed: e put: (self instVarNamed: e) ].
	^ strategy
]

{ #category : #'*Typer-GToolkit' }
GtPharoCompletionStrategy >> typGtAsPharoCompletionStrategyIn: aCoderViewModel [
	^ self
]
