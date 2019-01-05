Extension { #name : #GtPharoProgramNode }

{ #category : #'*Typer-GToolkit' }
GtPharoProgramNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [
	<typTypeArgument: 1 as: 'TypGtPharoCompletionStrategy'>
	<typTypeArgument: 2 as: 'RBProgramNode'>
	<typTypeResultAs: 'SequenceableCollection<GtCompletionAction>'>
	^ self completionActionsFor: aStrategy
]
