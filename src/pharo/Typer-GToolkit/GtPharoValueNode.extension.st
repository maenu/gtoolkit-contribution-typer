Extension { #name : #GtPharoValueNode }

{ #category : #'*Typer-GToolkit' }
GtPharoValueNode >> typGtGuessType: aStrategy in: anRbNode [
	<typPraResult: 'TypType'>
	<typPraArguments: 'TypGtPharoCompletionStrategy,RBProgramNode'>
	^ anRbNode typInfType
]
