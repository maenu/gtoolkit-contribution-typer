Extension { #name : 'GtPharoProgramNode' }

{ #category : '*Typer-GToolkit' }
GtPharoProgramNode >> typGtCompletionActionsFor: aStrategy in: anRbNode [
	<typPraResult: 'SequenceableCollection<GtCompletionAction>'>
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBProgramNode'>
	^ self completionActionsFor: aStrategy
]
