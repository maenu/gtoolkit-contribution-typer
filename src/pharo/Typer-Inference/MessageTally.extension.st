Extension { #name : #MessageTally }

{ #category : #'*Typer-Inference' }
MessageTally class >> typInfIsRunning [
	^ Timer isNotNil
]
