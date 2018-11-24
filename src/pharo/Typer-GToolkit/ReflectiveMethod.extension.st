Extension { #name : #ReflectiveMethod }

{ #category : #'*Typer-GToolkit' }
ReflectiveMethod >> typGtSourceFor: aView [
	<gtView>
	^ self compiledMethod typGtSourceFor: aView
]
