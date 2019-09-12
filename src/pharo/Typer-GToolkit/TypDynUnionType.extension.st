Extension { #name : #TypDynUnionType }

{ #category : #'*Typer-GToolkit' }
TypDynUnionType >> typGtItemsFor: aView [
	<typTypeArgument: 1 as: 'GtPhlowView'>
	<typTypeResultAs: 'GtPhlowView'>
	<gtView>
	^ self summary gtItemsFor: aView
]
