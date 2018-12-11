Extension { #name : #ReflectiveMethod }

{ #category : #'*Typer-GToolkit' }
ReflectiveMethod >> typGtSourceFor: aView [
	<gtView>
	<typTypeArgument: 1 as: 'GtPhlowProtoView'>
	<typTypeResultAs: 'GtPhlowProtoView'>
	^ self compiledMethod typGtSourceFor: aView
]
