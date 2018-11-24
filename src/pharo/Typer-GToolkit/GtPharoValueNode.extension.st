Extension { #name : #GtPharoValueNode }

{ #category : #'*Typer-GToolkit' }
GtPharoValueNode >> typGtGuessType: completionStrategy in: anRbNode [
	^ [ anRbNode typType ]
		on: TypNoInferrableTypeError
		do: [ nil ]
]
