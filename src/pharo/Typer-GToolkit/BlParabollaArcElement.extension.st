Extension { #name : #BlParabollaArcElement }

{ #category : #'*Typer-GToolkit' }
BlParabollaArcElement >> typGtOnMouseOut [
	(self childNamed: #label) visibility: BlVisibility hidden.
	super typGtOnMouseOut
]

{ #category : #'*Typer-GToolkit' }
BlParabollaArcElement >> typGtOnMouseOver [
	super typGtOnMouseOver.
	(self childNamed: #label) visibility: BlVisibility visible
]

{ #category : #'*Typer-GToolkit' }
BlParabollaArcElement >> typGtOnReset [
	(self childNamed: #label) visibility: BlVisibility hidden.
	self typGtOpacity: 0.7
]

{ #category : #'*Typer-GToolkit' }
BlParabollaArcElement >> typGtOpacity: aNumber [
	| edge |
	edge := self userData at: #typGtEdge.
	self border: (edge typGtBorder: aNumber).
	toHead background: (edge typGtBackground: aNumber)
]
