Extension { #name : #RGMethodDefinition }

{ #category : #'*Typer-GToolkit' }
RGMethodDefinition >> typGtSourceFor: aView [
	<gtView>
	^ self compiledMethod typGtSourceFor: aView
]