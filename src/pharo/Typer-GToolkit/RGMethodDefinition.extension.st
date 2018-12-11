Extension { #name : #RGMethodDefinition }

{ #category : #'*Typer-GToolkit' }
RGMethodDefinition >> typGtSourceFor: aView [
	<gtView>
	<typTypeArgument: 1 as: 'GtPhlowProtoView'>
	<typTypeResultAs: 'GtPhlowProtoView'>
	^ self compiledMethod typGtSourceFor: aView
]
