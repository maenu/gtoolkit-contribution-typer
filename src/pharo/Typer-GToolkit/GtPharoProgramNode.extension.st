Extension { #name : #GtPharoProgramNode }

{ #category : #'*Typer-GToolkit' }
GtPharoProgramNode >> typGtCompletionActionStreamFor: aStrategy in: anRbNode [
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBProgramNode'>
	^ self completionActionStreamFor: aStrategy
]
