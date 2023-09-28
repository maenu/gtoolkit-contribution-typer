Extension { #name : #GtPharoProgramNode }

{ #category : #'*Typer-GToolkit' }
GtPharoProgramNode >> typGtCompletionActionStreamFor: aStrategy in: anRbNode context: aContext [
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBProgramNode'>
	^ self completionActionStreamFor: aStrategy
]
