Extension { #name : #GtPharoValueNode }

{ #category : #'*Typer-GToolkit' }
GtPharoValueNode >> typGtGuessType: aStrategy in: anRbNode [
	<typTypeArgument: 1 as: 'TypGtPharoCompletionStrategy'>
	<typTypeArgument: 2 as: 'RBProgramNode'>
	<typTypeResultAs: 'TypType'>
	^ anRbNode typInfType
]
