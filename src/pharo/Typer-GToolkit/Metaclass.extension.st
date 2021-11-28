Extension { #name : #Metaclass }

{ #category : #'*Typer-GToolkit' }
Metaclass >> typGtVariableNames [
	^ super typGtVariableNames , self instanceSide classVarNames
]
